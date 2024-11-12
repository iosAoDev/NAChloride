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
  
  s.ios.vendored_libraries    = 'NAChloride/lib/libsodium.dylib', 'NAChloride/lib/libsodium.a'
  s.ios.vendored_frameworks   = 'NAChloride/lib/libsodium.dylib', 'NAChloride/lib/libsodium.a'
  s.header_mappings_dir = 'NAChloride/include'
  s.public_header_files = 'NAChloride/include/**/*.h'

end




