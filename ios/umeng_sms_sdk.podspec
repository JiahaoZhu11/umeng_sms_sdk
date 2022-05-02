#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint umeng_sms_sdk.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'umeng_sms_sdk'
  s.version          = '1.0.0'
  s.summary          = 'A Flutter plugin for integrating UMSMS, which is a SMS SDK provided by UMeng.'
  s.description      = <<-DESC
  A Flutter plugin for integrating UMSMS, which is a SMS SDK provided by UMeng.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.vendored_frameworks = 'Frameworks/Umeng/UMSMS.framework'

  s.static_framework = true

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
