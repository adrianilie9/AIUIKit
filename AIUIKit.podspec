Pod::Spec.new do |s|
  s.name             = 'AIUIKit'
  s.version          = '0.1.0'
  s.summary          = 'Simplify UIKit related tasks.'
  s.description      = <<-DESC
AIUIKit offers you a simplified way to perform certain tasks when working with UIKit.
- managing UIViewController hierarchy
- taking screenshots of UI elements
- generating blank images
- using external fonts
- formatting strings
- interacting with CGPoint and CGPathRef
                       DESC
  s.homepage         = 'https://github.com/adrianilie9/AIUIKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Adrian Ilie' => 'adrian.ilie.x64@gmail.com' }
  s.social_media_url = 'https://twitter.com/iadi64'
  
  s.source                  = { :git => 'https://github.com/adrianilie9/AIUIKit.git', :tag => 'V.0.1.0' }
  s.ios.deployment_target   = '8.0'
  s.swift_versions          = '5.0'
  s.frameworks              = 'UIKit'
  s.source_files            = 'AIUIKit/Classes/**/*'
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Example/Tests/*.swift'
  end
end
