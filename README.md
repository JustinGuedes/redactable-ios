# Redactable

[![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS-green?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-Green?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/spm-compatible-orange?style=flat-square)](https://img.shields.io/badge/spm-compatible-orange?style=flat-square)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Redactable.svg?style=flat-square)](https://img.shields.io/cocoapods/v/Redactable.svg)
[![Carthage Compatible](https://img.shields.io/badge/carthage-compatible-orange.svg?style=flat-square)](https://github.com/Carthage/Carthage)

A convenient library to show a shimmer effect while loading data. Easily convert your current view with a slick skeleton loading animation just by wrapping your view and conforming to a protocol.

![Redactable Example](/Example/example.gif)

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding Redactable as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/JustinGuedes/redactable-ios.git", .upToNextMajor(from: "0.1.0"))
]
```

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate Redactable into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Redactable', '~> 0.1'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate Redactable into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "JustinGuedes/redactable-ios" ~> 0.1
```

## Usage

Firstly, ensure your data class/struct conforms to `Redactable`:

```swift
extension Object: Redactable {

  static var placeholder: Object {
    // Return a version of this object that has placeholder data
  }

}
```
<br>

Secondly, create a bindable loadable property which allows you to control the state of the loading view:

```swift
@Binding
var loadable: Loadable<[Object]> = .loading
```
> **_NOTE:_** The possible values for `loadable` are: `loading, loaded([Object]), error(Error)`.
<br>

Lastly, wrap your content in a `LoadableView`:

```swift
LoadableView($loadable) { (data: [Object]) in
  // Use data 
}
```

## License

Redactable is released under the MIT license. [See LICENSE](https://github.com/JustinGuedes/redactable-ios/blob/main/LICENSE) for details.
