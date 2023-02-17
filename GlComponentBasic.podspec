#
# Be sure to run `pod lib lint GlComponentBasic.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GlComponentBasic'
  s.version          = '0.1.4'
  s.summary          = '基础库（UI、工具等）'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/geeklyc/GlComponentBasic'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lyc' => 'geeklyc@163.com' }
  s.source           = { :git => 'git@github.com:geeklyc/GlComponentBasic.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  
  # 类别
  s.subspec 'Category' do |ss|
    ss.source_files = 'GlComponentBasic/Classes/Category/**/*'
  end
  
  # Mediator
  s.subspec 'Mediator' do |ss|
    ss.source_files = 'GlComponentBasic/Classes/Mediator/**/*'
  end
  
  # WebView
  s.subspec 'WebView' do |ss|
    ss.source_files = 'GlComponentBasic/Classes/WebView/**/*'
  end
  
  # JSBridge
  s.subspec 'JSBridge' do |ss|
    ss.dependency 'WebViewJavascriptBridge', '~> 6.0'
  end
  
  # NativeCall
  s.subspec 'NativeCall' do |ss|
    ss.source_files = 'GlComponentBasic/Classes/NativeCall/**/*'
    ss.dependency 'MJExtension', '~> 3.2.2'
  end
  
  # 奔溃
  s.subspec 'CrashAnalytics' do |ss|
    ss.source_files = 'GlComponentBasic/Classes/CrashAnalytics/**/*'
    ss.dependency 'Masonry', '~> 1.1.0'
  end
  
  # Log
  s.subspec 'Log' do |ss|
    ss.source_files = 'GlComponentBasic/Classes/Log/**/*'
    ss.dependency 'CocoaLumberjack', '~> 3.7.2'
  end
  
  # A
  s.subspec 'A' do |ss|
    ss.source_files = 'GlComponentBasic/Classes/A/**/*'
    ss.resource_bundles = {
        'A' => [ 'GlComponentBasic/Assets/A/*' ]
    }
    ss.dependency 'Masonry', '~> 1.1.0'
  end
  
  # B
  s.subspec 'B' do |ss|
    ss.source_files = 'GlComponentBasic/Classes/B/**/*'
    ss.resource_bundles = {
        'B' => [ 'GlComponentBasic/Assets/B/*' ]
    }
    ss.dependency 'Masonry', '~> 1.1.0'
  end

#  s.source_files = 'GlComponentBasic/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GlComponentBasic' => ['GlComponentBasic/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
