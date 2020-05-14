#
# Be sure to run `pod lib lint YACOBasicController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YACOBasicController'
  s.version          = '0.1.2'
  s.summary          = 'A short description of YACOBasicController.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/LYFGH/YACOBasicController.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LYFGH' => 'yafei_v5@163.com' }
  s.source           = { :git => 'https://github.com/LYFGH/YACOBasicController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

#  s.source_files = 'YACOBasicController/Classes/**/*'
  
  
  
  s.subspec 'BaseViewController' do |baseViewController|
    baseViewController.source_files = 'YACOBasicController/Classes/BaseViewController/**/*.{h,m}'
    baseViewController.public_header_files = 'YACOBasicController/Classes/BaseViewController/**/*.h'
  end
  
  
  s.subspec 'RTRootNavigationController' do |rTRootNavigationController|
    rTRootNavigationController.source_files = 'YACOBasicController/Classes/RTRootNavigationController/**/*.{h,m}'
    rTRootNavigationController.public_header_files = 'YACOBasicController/Classes/RTRootNavigationController/**/*.h'
  end
  
  s.subspec 'BaseNavigationController' do |baseNavigationController|
    baseNavigationController.source_files = 'YACOBasicController/Classes/BaseNavigationController/**/*.{h,m}'
    baseNavigationController.public_header_files = 'YACOBasicController/Classes/BaseNavigationController/**/*.h'
    baseNavigationController.dependency 'YACOBasicController/RTRootNavigationController'
    
  end
  
  
  
  
  s.subspec 'BaseTabBarController' do |baseTabBar|
    baseTabBar.source_files = 'YACOBasicController/Classes/BaseTabBarController/**/*.{h,m}'
    baseTabBar.public_header_files = 'YACOBasicController/Classes/BaseTabBarController/**/*.h'
    
    
  end
  
  
  
  
  # s.resource_bundles = {
  #   'YACOBasicController' => ['YACOBasicController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
