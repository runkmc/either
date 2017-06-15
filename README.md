# Either

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/Either.svg?style=flat)](http://cocoapods.org/pods/Either)
[![License](https://img.shields.io/cocoapods/l/Either.svg?style=flat)](http://cocoapods.org/pods/Either)
[![Platform](https://img.shields.io/cocoapods/p/Either.svg?style=flat)](http://cocoapods.org/pods/Either)

Either is an implementation of [Haskell's `Either`
type](https://hackage.haskell.org/package/base-4.9.1.0/docs/Data-Either.html) in Swift. The current
version (1.x) is compatible with Swift 3.

## Usage

Either is an enum consisting of either a .right or a .left, each with an
associated value. It's commonly used in Haskell for error handling, with Right
holding a success value and Left holding a failure value. This is a more
functional way of handling errors compared to throwing and catching. 

The best way to see this library in action is by looking at the tests. Each
function is also commented upon in the Either source. 

## Installation

### Carthage
Add the following to your Cartfile:

```
github "runkmc/either"
```

Then run `carthage update`.

### CocoaPods

Add the following to your Podfile:

```
pod 'Either'
```

You will also need to make sure you're opting into using frameworks:

```
use_frameworks!
```

Then run `pod install`.

## Author

Kevin McGladdery, kevin.mcgladdery@gmail.com

## License

Either is available under the MIT license. See the LICENSE file for more info.
