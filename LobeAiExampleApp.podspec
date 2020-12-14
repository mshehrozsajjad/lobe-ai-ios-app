Pod::Spec.new do |spec|
  spec.name               = "LobeAiExampleApp"
  spec.version            = "3.1"
  spec.summary            = "A camera view controller with custom image picker and image cropping."
  spec.source             = { :git => "https://github.com/Tulleb/LobeAiExampleApp.git", :tag => spec.version.to_s }
  spec.requires_arc       = true
  spec.platform           = :ios, "9.0"
  spec.license            = "MIT"
  spec.source_files       = "LobeAiExampleApp/**/*.{swift}"
  spec.resources          = ["LobeAiExampleApp/ViewController/ConfirmViewController.xib", "LobeAiExampleApp/CameraViewAssets.xcassets", "LobeAiExampleApp/CameraView.strings"]
  spec.homepage           = "https://github.com/AlexLittlejohn/LobeAiExampleApp.git"
  spec.author             = { "Alex Littlejohn" => "alexlittlejohn@me.com", "Guillaume Bellut" => "guillaume@bellut.com" }
  spec.swift_version      = '5.0'
end
