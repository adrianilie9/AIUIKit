# AIUIKit

[![Version](https://img.shields.io/cocoapods/v/AIUIKit.svg?style=flat)](https://cocoapods.org/pods/AIUIKit)
[![License](https://img.shields.io/cocoapods/l/AIUIKit.svg?style=flat)](https://cocoapods.org/pods/AIUIKit)
[![Platform](https://img.shields.io/cocoapods/p/AIUIKit.svg?style=flat)](https://cocoapods.org/pods/AIUIKit)

AIUIKit is a collection of methods that can help building the user interface of almost any iOS application. It's main features include:

- UIColor creation using HEX color codes
- HTML string filtering
- Strings trimming and size calculation required for rendering
- UIImage creation using vector fonts

## Requirements

- Swift 5.0
- iOS >= 10.0

## Installation

AIUIKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AIUIKit'
```

## Usage

##### Replace application root view controller

```swift
AIUIKit.replaceRootViewController(viewController: UIViewController)
```

### UIColor

All UIColor methods are implemented as an extension on UIColor class.

##### Creating UIColor using HEX code

```swift
UIColor(hex: String, alpha: CGFloat? = 1.0)
```

### String

All string methods are implemented as an extension on String class.

##### HTML tags removal from a string

```swift
stringInstance.htmlTagsFiltered()
```

##### Trimming string to specified length

```swift
stringInstance.trimToLength(length: Int)
```

##### Calculate visibile part of a string when rendered

```swift
stringInstance.visible(inSize size: CGSize, withFont font: UIFont)
```

##### Calculate height to display a string

```swift
stringInstance.requiredHeightToDisplay(forWidth width: CGFloat, withFont font: UIFont)
```

### UIFont

##### Printing to console all fonts available in the app

```swift
UIFont.printAvailableFonts()
```

### UIImage

All UIImage methods are implemented as an extension on UIImage class.

##### Create transparent image

```swift
UIImage(size: CGSize)
```

##### Create colored image

```swift
UIImage(size: CGSize, color: UIColor)
```

##### Create image with contents of a view

```swift
UIImage(ofView view: UIView)
```

##### Create image with contents of a string

```swift
UIImage(size: CGSize, font: UIFont, color: UIColor, content: String)
```


### CGSize

All CGSize methods are implemented as an extension on CGSize struct.

##### Resize to fit in a maximum size while maintaining the aspect ratio

```swift
sizeStruct.resize(toMaximumSize size: CGSize)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

AIUIKit is available under the MIT license. See the LICENSE file for more info.

## Author

Adrian Ilie, adrian.ilie.x64@gmail.com
