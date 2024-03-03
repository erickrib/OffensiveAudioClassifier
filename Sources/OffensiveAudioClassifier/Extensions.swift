//
//  Extensions.swift
//
//
//  Created by Erick Ribeiro on 02/03/24.
//

import Foundation
import Speech

public extension SFSpeechRecognizer {
    static func hasAuthorizationToRecognize() async -> Bool {
        await withCheckedContinuation { continuation in
            requestAuthorization { status in
                continuation.resume(returning: status == .authorized)
            }
        }
    }
}

public extension AVAudioSession {
    func hasPermissionToRecord() async -> Bool {
        await withCheckedContinuation { continuation in
            AVAudioApplication.requestRecordPermission() { authorized in
                continuation.resume(returning: authorized)
            }
        }
    }
}
