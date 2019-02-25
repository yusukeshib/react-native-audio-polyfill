require 'json'
version = JSON.parse(File.read('package.json'))["version"]

Pod::Spec.new do |s|

  s.name           = "RNAudio"
  s.version        = version
  s.summary        = "Audio polyfill for React Native"
  s.homepage       = ""
  s.license        = "MIT"
  s.author         = { "Yusuke Shibata" => "shibata@fata.io" }
  s.platform       = :ios, "7.0"
  s.source         = { :git => "https://github.com/yusukeshibata/react-native-audio-polyfill.git", :tag => "v#{s.version}" }
  s.source_files   = 'RNAudio/*.{h,m}'
  s.preserve_paths = "**/*.js"
  s.dependency 'React'

end
