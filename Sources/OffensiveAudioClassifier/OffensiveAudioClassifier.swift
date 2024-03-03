//
//  OffensiveAudioClassifier.swift
//
//
//  Created by Erick Ribeiro on 02/03/24.
//

import AVFoundation
import Foundation
import Speech
import SwiftUI

public protocol OffensiveAudioClassifierDelegate: AnyObject {
    func updateTranscript(_ text: String)
    func updateOffensiveText(_ text: String)
}

open class OffensiveAudioClassifier: ObservableObject {
    
    @Published public var transcript: String = ""
    @Published public var textOffensive: String = "neither"
    
    public weak var delegate: OffensiveAudioClassifierDelegate?
    
    private var audioEngine: AVAudioEngine?
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?
    private var recognizer: SFSpeechRecognizer?
    
    public init(initialTranscript: String? = nil) {
        recognizer = SFSpeechRecognizer()
        
        Task(priority: .background) {
            do {
                guard recognizer != nil else {
                    throw RecognizerError.uninitializedRecognizer
                }
                guard await SFSpeechRecognizer.hasAuthorizationToRecognize() else {
                    throw RecognizerError.unauthorizedRecognition
                }
                guard await AVAudioSession.sharedInstance().hasPermissionToRecord() else {
                    throw RecognizerError.recordingNotAllowed
                }
            } catch {
                speakError(error)
            }
        }
        
        if let initialTranscript = initialTranscript {
            self.transcript = initialTranscript
        }
    }
    
    deinit {
        reset()
    }
    
    public func reset() {
        task?.cancel()
        audioEngine?.stop()
        audioEngine = nil
        request = nil
        task = nil
    }
    
    public func transcribe() {
        DispatchQueue(label: "Speech Recognizer Queue", qos: .background).async { [weak self] in
            guard let self = self, let recognizer = self.recognizer, recognizer.isAvailable else {
                self?.speakError(RecognizerError.recognizerUnavailable)
                return
            }
            
            do {
                let (audioEngine, request) = try Self.prepareEngine()
                self.audioEngine = audioEngine
                self.request = request
                
                self.task = recognizer.recognitionTask(with: request) { result, error in
                    let receivedFinalResult = result?.isFinal ?? false
                    let receivedError = error != nil
                    
                    if receivedFinalResult || receivedError {
                        audioEngine.stop()
                        audioEngine.inputNode.removeTap(onBus: 0)
                    }
                    
                    if let result = result {
                        self.speak(result.bestTranscription.formattedString)
                    }
                }
            } catch {
                self.reset()
                self.speakError(error)
            }
        }
    }
    
    public func stopTranscribing() {
         reset()
    }
    
    private static func prepareEngine() throws -> (AVAudioEngine, SFSpeechAudioBufferRecognitionRequest) {
        let audioEngine = AVAudioEngine()
        
        let request = SFSpeechAudioBufferRecognitionRequest()
        request.shouldReportPartialResults = true
        
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        let inputNode = audioEngine.inputNode
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) {
            (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            request.append(buffer)
        }
        audioEngine.prepare()
        try audioEngine.start()
        
        return (audioEngine, request)
    }
    
    private func speak(_ message: String) {
        DispatchQueue.main.async {
            if !message.isEmpty {
                self.transcript = message
                self.detectOffensive(message: message)
            }
        }
    }
    
    private func speakError(_ error: Error) {
        var errorMessage = ""
        if let error = error as? RecognizerError {
            errorMessage += error.message
        } else {
            errorMessage += error.localizedDescription
        }
        transcript = "<< \(errorMessage) >>"
    }
    
    public func detectOffensive(message: String) {
        let model = try! AggressionClassifier_5000()
        
        guard let textOffensiveOutPut = try? model.prediction(text: message) else {
            fatalError("Unexpected runtime error.")
        }
        let prediction = textOffensiveOutPut.label
        self.textOffensive = prediction
        
        if (delegate != nil) {
            delegate?.updateTranscript(transcript)
            delegate?.updateOffensiveText(textOffensive)
        }
    }
}

enum RecognizerError: Error {
    case uninitializedRecognizer
    case unauthorizedRecognition
    case recordingNotAllowed
    case recognizerUnavailable
    
    var message: String {
        switch self {
        case .uninitializedRecognizer:
            return "Unable to initialize speech recognizer"
        case .unauthorizedRecognition:
            return "Not authorized to recognize speech"
        case .recordingNotAllowed:
            return "Not allowed to record audio"
        case .recognizerUnavailable:
            return "Recognizer is unavailable"
        }
    }
}


