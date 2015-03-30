NAChloride
===========

* Secret-key authenticated encryption ([libsodium](https://github.com/jedisct1/libsodium))
* Scrypt
* XSalsa20
* AES (256-CTR)
* TwoFish (CTR)
* Digest (SHA2, SHA3/Keccak)
* HMAC (SHA1, SHA2, SHA3)
* HKDF (RFC 5849)
* Keychain Utils


This project includes the [libsodium](https://github.com/jedisct1/libsodium) C library but doesn't have Objective-C wrappers for all the methods. Feel free to contribute with pull requests.

See [gabriel/TSTripleSec](https://github.com/gabriel/TSTripleSec) for more usage examples of this library.

NAChloride uses [gabriel/GRUnit](https://github.com/gabriel/GRUnit) for unit testing.

# Podfile

```ruby
platform :ios, '7.0'
pod "NAChloride"
```

# Init

You should call NAChlorideInit() to initialize on app start. Multiple calls to this are ignored. (This calls `sodium_init()` with `dispatch_once`.)

```objc
NAChlorideInit();
```

# Secret-key authenticated encryption

(via libsodium)

Encrypt uses `crypto_secretbox_easy` and decrypt uses `crypto_secretbox_open_easy`. See libsodium for details.

```objc
NSData *key = [NARandom randomData:NASecretBoxKeySize error:&error];
NSData *nonce = [NARandom randomData:NASecretBoxNonceSize error:nil];
NSData *message = [@"This is a secret message" dataUsingEncoding:NSUTF8StringEncoding];

NASecretBox *secretBox = [[NASecretBox alloc] init];
NSData *encrypted = [secretBox encrypt:message nonce:nonce key:key error:&error];
// If an error occurred encrypted will be nil and error set

NSData *decrypted = [secretBox decrypt:encrypted nonce:nonce key:key error:&error];
```

# Scrypt

(via libsodium)

```objc
NSData *key = [@"toomanysecrets" dataUsingEncoding:NSUTF8StringEncoding];
NSData *salt = [NARandom randomData:48 error:&error]; // Random 48 bytes
NSData *data = [NAScrypt scrypt:key salt:salt N:32768U r:8 p:1 length:64 error:nil];
```

# XSalsa20

(via libsodium)

```objc
// Nonce should be 24 bytes
// Key should be 32 bytes
NAXSalsa20 *XSalsa20 = [[NAXSalsa20 alloc] init];
NSData *encrypted = [XSalsa20 encrypt:message nonce:nonce key:key error:&error];
```

# AES (256-CTR)

```objc
// Nonce should be 16 bytes
// Key should be 32 bytes
NAAES *AES = [[NAAES alloc] initWithAlgorithm:NAAESAlgorithm256CTR];
NSData *encrypted = [AES encrypt:message nonce:nonce key:key error:&error];
```

# TwoFish (CTR)

```objc
// Nonce should be 16 bytes
// Key should be 32 bytes
NATwoFish *twoFish = [[NATwoFish alloc] init];
NSData *encrypted = [twoFish encrypt:message nonce:nonce key:key error:&error];
```

# HMAC (SHA1, SHA2, SHA3)

```objc
NSData *mac1 = [NAHMAC HMACForKey:key data:data algorithm:NAHMACAlgorithmSHA2_512];
NSData *mac2 = [NAHMAC HMACForKey:key data:data algorithm:NAHMACAlgorithmSHA3_512];
```

# Digest (SHA2, SHA3)

```objc
NSData *digest1 = [NADigest digestForData:data algorithm:NADigestAlgorithmSHA2_256];
NSData *digest2 = [NADigest digestForData:data algorithm:NADigestAlgorithmSHA3_512];

// Directly use SHA3
NSData *sha = [NASHA3 SHA3ForData:data digestBitLength:512];
```

# HKDF (RFC 5849)

```objc
NSData *key = [@"toomanysecrets" dataUsingEncoding:NSUTF8StringEncoding];
NSData *salt = [NARandom randomData:32 error:nil];

NSData *derivedKey = [NAHKDF HKDFForKey:key algorithm:NAHKDFAlgorithmSHA256 salt:salt info:nil length:64 error:nil];
```

# Keychain Utils

```objc
NSData *key = [NARandom randomData:32 error:&error];
[NAKeychain addSymmetricKey:key applicationLabel:@"NAChloride" tag:nil label:nil];
NSData *keyOut = [NAKeychain symmetricKeyWithApplicationLabel:@"NAChloride"];
```

# NSData Utils
```objc
NSData *data = [@"deadbeef" na_dataFromHexString];
[data na_hexString]; // @"deadbeef";
```
