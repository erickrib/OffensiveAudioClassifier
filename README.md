# OffensiveAudioClassifier
> Uses voice recognition to transcribe and detect offensive content in audio.

## Overview

The _"OffensiveAudioClassifier"_ library provides an innovative solution for recognizing offensive content by collecting real-time audio. It harnesses the power of machine learning and Apple's Speech framework to transcribe audio into text and classify it into three categories: "neither" (neutral), "offensive," and "hate" (hate speech).

* Audio Transcription: Transcribes audio into text with high precision, utilizing Apple's [_Speech_](https://developer.apple.com/documentation/speech/) framework.
* Offense Detection: Identifies offensive language and hate speech in the transcribed text.
* Machine Learning Model: Implements a robust machine learning model trained with over 35.000 expressions, using Apple's Create ML.
* Supports both _SwiftUI_ and _UIKit_.
* Does not require internet connection for use.

### Benefits

* Content Moderation: Facilitates content moderation on online platforms such as forums, social networks, and messaging apps.
* Combatting Hate Speech: Protects users against offensive and discriminatory content.
* Enhanced User Experience: Provides a more enjoyable and positive experience for your users.

## Requirements
* iOS 17.0+
* macOS 14.0+
* watchOS 10.0+
* tvOS 17.0+

## Installation

### Swift Package Manager

1. File > Add Package Dependencies... >
2. Add `https://github.com/erickrib/OffensiveAudioClassifier`

_OR_

Update `dependencies` in `Package.swift`
```swift
dependencies: [
    .package(url: "https://github.com/erickrib/OffensiveAudioClassifier", .upToNextMajor(from: "1.0.5"))
]
```

### Cocoapods

OffensiveAudioClassifier is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'OffensiveAudioClassifier'
```

## Usage

Next, import the library into your Swift code:
```swift

import OffensiveAudioClassifier

```

### SwiftUI

#### Initialization
For SwiftUI applications, before using any methods of the library, you need to first instantiate the class. You can use the @StateObject property wrapper to manage the lifecycle of the _OffensiveAudioClassifier_ instance:

```swift

@StateObject var offensiveClassifier = OffensiveAudioClassifier()

```
#### Features:

```swift

// You can initialize the OffensiveAudioClassifier object with an initial transcript.
@StateObject var offensiveClassifier = OffensiveAudioClassifier(initialTranscript: "example text inital")

// Initiates the transcription process to convert audio to text. Begins collecting audio input from the microphone.
offensiveClassifier.transcribe()

// Stops the transcription process.
offensiveClassifier.stopTranscribing()

// Accesses the machine learning model directly. Detects offensive content by providing a string input.
offensiveClassifier.detectOffensive(message: "exemple text")

// Accesses the text classification property that can indicate "neither," "offensive," or "hate" classifications.
offensiveClassifier.textClassification

// Property provides the real-time transcription of audio collected from the microphone.
offensiveClassifier.transcript

```

### UIKit

#### Initialization
Before using any method from _OffensiveAudioClassifier_, instantiate the main class as a state object to manage the library's lifecycle.

```swift

import UIKit
import OffensiveAudioClassifier

class ViewController: UIViewController {
    var offensiveClassifier: OffensiveAudioClassifier?

    override func viewDidLoad() {
        super.viewDidLoad()
        offensiveClassifier = OffensiveAudioClassifier()
    }
}

```

The _OffensiveAudioClassifier_ class provides two properties: _transcript_ and _textClassification_. You can observe these properties to get real-time updates on the transcribed text and its classification.

To observe these properties, you can create a custom observer by conforming to the _OffensiveAudioClassifierDelegate_ protocol:

```swift
import UIKit
import OffensiveAudioClassifier

class ViewController: UIViewController, OffensiveAudioClassifierDelegate {
    var offensiveClassifier: OffensiveAudioClassifier?

    override func viewDidLoad() {
        super.viewDidLoad()
        offensiveClassifier = OffensiveAudioClassifier()

        // Sets the delegate of the offensiveClassifier to the current object.  
        offensiveClassifier?.delegate = self
    }

    func updateTranscript(_ text: String) {
        // Handle the updated transcript
    }

    func updateOffensiveText(_ text: String) {
        // Handle the updated offensive text classification
    }
}

```

 To start transcribing audio, call the transcribe() method

```swift

offensiveClassifier?.transcribe()

```

To stop transcribing, call the stopTranscribing() method:

```swift
offensiveClassifier?.stopTranscribing()
```
### Permissions

To use the voice recognition and audio recording features, your application must request and obtain the necessary permissions from the user. Ensure that you have added the _NSMicrophoneUsageDescription_ and _NSSpeechRecognitionUsageDescription_ keys to your application's [_Info.plist_](https://developer.apple.com/documentation/bundleresources/information_property_list) file with appropriate descriptions.

#### Example


| Key                                  | Type                        | Value                                                 |
|--------------------------------------|-----------------------------|-------------------------------------------------------|
| Privacy - Speech Recognition Usage Description | String                  | This app needs access to the microphone to record and share audio in real-time. |
| Privacy - Microphone Usage Description        | String                  | This app requires access to speech recognition to transcribe and analyze audio content. |


**Attention**: To use the voice recognition and audio recording features, your application must request and obtain the necessary permissions from the user. Without these settings, the library will not function correctly.


