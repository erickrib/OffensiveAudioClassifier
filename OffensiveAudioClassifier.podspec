Pod::Spec.new do |s|
  s.name             = 'OffensiveAudioClassifier'
  s.version          = '1.0.0'
  s.summary          = 'A powerful library for iOS developers to detect offensive language and hate speech in audio files, with support for SwiftUI and UIKit.'

  s.description      = <<-DESC
 The OffensiveAudioClassifier library integrates voice-based offensive content detection in iOS apps, utilizing Apple's Speech framework and a BERT-based machine learning model. It accurately identifies offensive language and hate speech, supporting both SwiftUI and UIKit for content moderation and sentiment analysis.
                       DESC

  s.homepage         = 'https://github.com/erickrib/OffensiveAudioClassifier'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'erick' => 'erickrocha965@gmail.com' }
  s.source           = { :git => 'https://github.com/erickrib/OffensiveAudioClassifier.git', :tag => s.version.to_s }

  s.ios.deployment_target = '17.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/OffensiveAudioClassifier/**/*'
end
