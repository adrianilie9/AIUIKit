Pod::Spec.new do |s|
  s.name             = 'AIUIKit'
  s.version          = '1.3.1'
  s.summary          = 'Simplify UIKit related tasks.'
  s.description      = <<-DESC
AIUIKit is a collection of methods that can help building the user interface of almost any iOS application. It's main features include:

- UIColor creation using HEX color codes
- HTML string escaping
- Strings trimming and size calculation required for rendering
- UIImage creation using vector fonts
                       DESC
  s.homepage         = 'https://github.com/adrianilie9/AIUIKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Adrian Ilie' => 'adrian.ilie.x64@gmail.com' }
  s.social_media_url = 'https://twitter.com/iadi64'
  
  s.source                  = { :git => 'https://github.com/adrianilie9/AIUIKit.git', :tag => 'V.1.3.1' }
  s.ios.deployment_target   = '10.0'
  s.swift_versions          = '5.0'
  s.frameworks              = 'UIKit'
  s.source_files            = 'AIUIKit/Classes/**/*'
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Example/Tests/*.swift'
  end
end
