Pod::Spec.new do |s|

  s.name         = "NAChloride"
  s.version      = "2.3.2"
  s.summary      = "Objective-C library for libsodium (NaCl)"
  s.homepage     = "https://github.com/iosAoDev/NAChloride"
  s.license      = { :type => "MIT" }
  s.author       = { "Gabriel Handford" => "gabrielh@gmail.com" }
  s.source       = { :git => "hhttps://github.com/iosAoDev/NAChloride.git", :branch => 'master' }
  s.requires_arc = true

  s.ios.deployment_target = "12.0"
  s.ios.source_files = 'NAChloride/**/*.{c,h,m}'
    
  s.tvos.deployment_target = "10.0"
  s.tvos.source_files = 'NAChloride/**/*.{c,h,m}'
  
  s.osx.deployment_target = "10.8"
  s.osx.source_files = 'NAChloride/**/*.{c,h,m}'
  
  s.public_header_files = 'NAChloride/**/*.h'
  s.private_header_files = 'NAChloride/libsodium/src/libsodium/include/sodium/private/**/*.h'
  
  s.ios.vendored_libraries    = 'NAChloride/libsodium/liblibsodium-iOS.a', 'NAChloride/libPods-NAChloride_iOS.a'
  s.osx.vendored_library    = 'NAChloride/libsodium/liblibsodium-macOS.a'
end




