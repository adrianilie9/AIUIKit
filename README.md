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

### UIViewController hierarchy

Replacing the application root view controller can be performed by calling ```AIUIKit.replaceRootViewController(viewController: vc)```.

### UIColor

Creating a UIColor with the hex color code of ```f0a30a``` and alpha channel value of ```0.5```.

```swift
UIColor(hex: "f0a30a", alpha: 0.5)
```

Alpha channel value is optional, if not specified it defaults to ```1.0```


### String

All string methods are implemented as an extension on String type.

##### HTML tags removal

To remove the HTML tags from a string call ```htmlTagsFiltered()``` method.

##### Trimming to specified length

All strings support ```trimToLength(length: Int)``` method that allows an exact trim.

##### Rendered size 

You can calculate what part of a string will be visible when rendered with a specified font in a given size by using ```visible(inSize size: CGSize, withFont font: UIFont)```.

When requiring the height necessary to display a string, ```requiredHeightToDisplay(forWidth width: CGFloat, withFont font: UIFont)``` can be used to calculate this value.

### UIFont

When working with custom fonts, you can use ```UIFont.printAvailableFonts()``` to print in console all fonts available in the app and extract the name of the font you want to use.

### UIImage

##### Blank images

To create a 1p x 1p image with the ```f0a30a``` fill color you can use the method ```UIImage(size: CGSize(x: 1.0, y: 1.0), color: UIColor(hex: "f0a30a")```.

Creating a transparent image can be achieved by calling ```UIImage(size: CGSize(width: 1.0, height: 1.0))```.

##### Screenshots

Taking a screenshot of a view can be performed by calling ```UIImage(ofView: view)```.

##### Labels

To create images with text contents call the initializer ```init?(size: CGSize, font: UIFont, color: UIColor, content: String)```. This works with vector fonts too.

### CGSize

CGSize resizing is supported through ```resize(toMaximumSize size: CGSize)``` method.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

AIUIKit is available under the MIT license. See the LICENSE file for more info.

## Author

Adrian Ilie, adrian.ilie.x64@gmail.com
