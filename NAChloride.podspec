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

  s.pod_target_xcconfig = {
    "SWIFT_INCLUDE_PATHS" => '$(inherited) "${PODS_XCFRAMEWORKS_BUILD_DIR}/NAClibsodium"'
    "HEADER_SEARCH_PATHS" => '$(inherited) "${PODS_XCFRAMEWORKS_BUILD_DIR}/NAClibsodium/src/libsodium/include/sodium\" \"$(inherited) "${PODS_XCFRAMEWORKS_BUILD_DIR}/NAClibsodium/libsodium/src/libsodium/include\"'
    "OTHER_CFLAGS" => '-DNATIVE_LITTLE_ENDIAN=1 -DHAVE_MADVISE -DHAVE_MMAP -DHAVE_MPROTECT -DHAVE_POSIX_MEMALIGN -DHAVE_WEAK_SYMBOLS'
  }

  s.user_target_xcconfig = {
    "SWIFT_INCLUDE_PATHS" => '$(inherited) "${PODS_XCFRAMEWORKS_BUILD_DIR}/NAClibsodium"'
    "HEADER_SEARCH_PATHS" => '$(inherited) "${PODS_XCFRAMEWORKS_BUILD_DIR}/NAClibsodium/src/libsodium/include/sodium\" \"$(inherited) "${PODS_XCFRAMEWORKS_BUILD_DIR}/NAClibsodium/libsodium/src/libsodium/include\"'
    "OTHER_CFLAGS" => '-DNATIVE_LITTLE_ENDIAN=1 -DHAVE_MADVISE -DHAVE_MMAP -DHAVE_MPROTECT -DHAVE_POSIX_MEMALIGN -DHAVE_WEAK_SYMBOLS'
  }
  
  s.vendored_frameworks = "NAClibsodium.xcframework"
  
end

