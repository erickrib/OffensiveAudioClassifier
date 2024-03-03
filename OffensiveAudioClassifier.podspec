Pod::Spec.new do |s|
  s.name             = 'OffensiveAudioClassifier'
  s.version          = '1.0.0'
  s.summary          = 'A library for detecting offensive content and words in audio files using Apple's Speech framework and a machine learning model based on the BERT algorithm. Trained on a dataset of over 35,000 phrases containing offensive content, it accurately classifies audio into categories of "neither", "offensive" and "hate".'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 The OffensiveAudioClassifier library empowers iOS developers to seamlessly integrate voice-based offensive content detection features into their applications. Leveraging Apple's Speech framework for audio transcription and a machine learning model based on the BERT algorithm created by Create ML, this library offers advanced capabilities in identifying offensive language and hate speech.

While still in its early stages, the library has been trained on a dataset of over 35,000 offensive phrases. However, detecting implicitly offensive and hate speech phrases may present challenges and may not always be accurate. The model performs best with phrases containing explicit offensive words.

OffensiveAudioClassifier supports both SwiftUI and UIKit, making integration easy for developers. It classifies audio content into categories of "neither," "offensive," and "hate. Whether for content moderation, sentiment analysis, or guideline compliance, it provides a reliable solution for detecting and mitigating harmful audio content.
                       DESC

  s.homepage         = 'https://github.com/erickrib/OffensiveAudioClassifier'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'erick' => 'erickrocha965@gmail.com' }
  s.source           = { :git => 'https://github.com/erickrib/OffensiveAudioClassifier.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/erickrib/'

  s.ios.deployment_target = '17.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/OffensiveAudioClassifier/**/*'
end
