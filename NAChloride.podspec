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
  
  s.public_header_files = 'NAChloride/libsodium/src/libsodium/include/sodium/**/*.h'
  s.private_header_files = 'NAChloride/libsodium/src/libsodium/include/sodium/private/**/*.h'
    
  s.pod_target_xcconfig = {
    "HEADER_SEARCH_PATHS": '"$(PODS_ROOT)/NAChloride/NAChloride/" "$(PODS_ROOT)/NAChloride/NAChloride/libsodium/src/libsodium/include/sodium/" "$(PODS_ROOT)/NAChloride/NAChloride/libsodium/src/libsodium/include/"',
    "OTHER_CFLAGS" => '-DNATIVE_LITTLE_ENDIAN=1 -DHAVE_MADVISE -DHAVE_MMAP -DHAVE_MPROTECT -DHAVE_POSIX_MEMALIGN -DHAVE_WEAK_SYMBOLS',
    "OTHER_LDFLAGS" => '-Wl,-undefined,dynamic_lookup'
  }

  s.user_target_xcconfig = {
    "HEADER_SEARCH_PATHS": '"$(PROJECT_DIR)/NAChloride/NAChloride/" "$(PROJECT_DIR)/libsodium/src/libsodium/include/sodium/" "$(PROJECT_DIR)/libsodium/src/libsodium/include/"',
    "OTHER_CFLAGS" => '-DNATIVE_LITTLE_ENDIAN=1 -DHAVE_MADVISE -DHAVE_MMAP -DHAVE_MPROTECT -DHAVE_POSIX_MEMALIGN -DHAVE_WEAK_SYMBOLS',
    "OTHER_LDFLAGS" => '-Wl,-undefined,dynamic_lookup'
  }
  
  s.ios.vendored_library    = 'NAChloride/libsodium/liblibsodium-iOS.a'
  s.osx.vendored_library    = 'NAChloride/libsodium/liblibsodium-macOS.a'
end




