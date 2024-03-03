Pod::Spec.new do |s|
  s.name             = 'OffensiveAudioClassifier'
  s.version          = '1.0.0'
  s.summary          = 'A short description of OffensiveAudioClassifier.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
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
