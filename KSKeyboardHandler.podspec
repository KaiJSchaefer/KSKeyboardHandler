#
# Be sure to run `pod lib lint KSKeyboardHandler.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "KSKeyboardHandler"
  s.version          = "0.1.0"
  s.summary          = "This library provides a category for UIView to handle UIKeyboardWillChangeFrameNotification."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "This CocoaPod provides the ability to handle UIKeyboardWillChangeFrameNotification and replace the view position if it is necessary."

  s.homepage         = "https://github.com/KaiJSchaefer/KSKeyboardHandler"
  s.license          = 'MIT'
  s.author           = { "Kai Schaefer" => "kai.j.schaefer@gmx.net" }
  s.source           = { :git => "https://github.com/KaiJSchaefer/KSKeyboardHandler.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/Kai_Schaefer'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'KSKeyboardHandler' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
