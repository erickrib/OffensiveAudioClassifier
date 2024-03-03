Pod::Spec.new do |s|
  s.name             = 'OffensiveAudioClassifier'
  s.version          = '1.0.5'
  s.summary          = 'A powerful library for iOS developers to detect offensive language and hate speech in audio files, with support for SwiftUI and UIKit.'

  s.description      = <<-DESC
 The OffensiveAudioClassifier library integrates voice-based offensive content detection in iOS apps, utilizing Apple's Speech framework and a BERT-based machine learning model. It accurately identifies offensive language and hate speech, supporting both SwiftUI and UIKit for content moderation and sentiment analysis.
                       DESC

  s.homepage         = 'https://github.com/erickrib/OffensiveAudioClassifier'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Erick Ribeiro' => 'erickrocha965@gmail.com', 'Gabriel Eduardo' => 'exemplo@gmail.com', 'Letícia Malagutti' => 'leticiamalagutti@yahoo.com.br', 'Victor Inácio' => 'chustrupgamer@gmail.com' }
  s.source           = { :git => 'https://github.com/erickrib/OffensiveAudioClassifier.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/erickrib/'

  s.language = 'Swift'
  s.ios.deployment_target = '17.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/OffensiveAudioClassifier/**/*'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
end
