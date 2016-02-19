# KSKeyboardHandler

[![CI Status](http://img.shields.io/travis/Kai Schaefer/KSKeyboardHandler.svg?style=flat)](https://travis-ci.org/Kai Schaefer/KSKeyboardHandler)
[![Version](https://img.shields.io/cocoapods/v/KSKeyboardHandler.svg?style=flat)](http://cocoapods.org/pods/KSKeyboardHandler)
[![License](https://img.shields.io/cocoapods/l/KSKeyboardHandler.svg?style=flat)](http://cocoapods.org/pods/KSKeyboardHandler)
[![Platform](https://img.shields.io/cocoapods/p/KSKeyboardHandler.svg?style=flat)](http://cocoapods.org/pods/KSKeyboardHandler)

## KSKeyboardHandler

This library provides a category for UIView to handle UIKeyboardWillChangeFrameNotification.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## How To Use

Just `#import "UIView+KSKeyboardHandler.h"` and add to your UIView `addKeyboardListner`.
Here is a simple example of how to use the category:

```objective-c
#import "UIView+KSKeyboardHandler.h"


UIView *sampleView         = UIView.new;    

[sampleView addKeyboardListner];

```

## Requirements
iOS 7+

## Installation

KSKeyboardHandler is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "KSKeyboardHandler"
```

## Author

Kai Schaefer, kai.j.schaefer(at)gmx.net

## License

KSKeyboardHandler is available under the MIT license. See the LICENSE file for more info.
