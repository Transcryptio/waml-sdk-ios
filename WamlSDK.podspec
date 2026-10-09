Pod::Spec.new do |spec|
  spec.name = 'WamlSDK'
  spec.version = '0.1.0'
  spec.summary = 'A native address screening sheet with a bundled WAML form.'
  spec.homepage = 'https://github.com/Transcryptio/waml-sdk-ios'
  spec.author = 'Transcryptio'
  spec.license = { :type => 'Proprietary', :file => 'LICENSE' }
  spec.source = { :http => 'https://github.com/Transcryptio/waml-sdk-ios/releases/download/v0.1.0/WamlSDK-0.1.0.zip', :sha256 => '2840dca2483683ffaa25db857b5f8decd665bdd40e5e71fd6cadad840a918eba' }
  spec.ios.deployment_target = '15.0'
  spec.swift_version = '5.0'
  spec.static_framework = true
  spec.vendored_frameworks = 'WamlSDK.xcframework'
  spec.resources = 'WamlSDKResources.bundle'
  spec.frameworks = 'UIKit', 'WebKit'
end
