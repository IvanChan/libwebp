#
# Be sure to run `pod lib lint Rudolph.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'libwebp'
  s.version          = '1.0.2'
  s.summary          = 'Library to encode and decode images in WebP format.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://developers.google.com/speed/webp/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'BSD', :file => 'COPYING' }
  s.author           = { 'Google Inc.' => '' }
  s.source           = { :git => 'https://github.com/IvanChan/libwebp.git'}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  # s.default_subspec = 'core'

  s.compiler_flags = "-D_THREAD_SAFE"
  s.requires_arc = false

  s.pod_target_xcconfig = {"USER_HEADER_SEARCH_PATHS" => "$(inherited) ${PODS_ROOT}/libwebp/**"}

  s.subspec 'webp' do |spec|

    spec.header_dir = "webp"
    spec.source_files = "src/webp/*.h"    
    
  end

  s.subspec 'core' do |spec|

    spec.header_dir = "webp"
    spec.source_files = ["src/utils/*.{h,c}",
                          "src/dsp/*.{h,c}",
                          "src/enc/*.{h,c}",
                          "src/dec/*.{h,c}"] 
    spec.dependency 'libwebp/webp'
    
  end


  s.subspec 'utils' do |spec|

    spec.dependency 'libwebp/core'

  end

  s.subspec 'dsp' do |spec|

    spec.dependency 'libwebp/core'

  end

  s.subspec 'enc' do |spec|

    spec.dependency 'libwebp/core'

  end

  s.subspec 'dec' do |spec|

    spec.dependency 'libwebp/core'

  end

  s.subspec 'demux' do |spec|

    spec.source_files = "src/demux/*.{h,c}"    
    spec.dependency 'libwebp/core'

  end

  s.subspec 'mux' do |spec|

    spec.source_files = "src/mux/*.{h,c}"    
    spec.dependency 'libwebp/core'

  end

  s.subspec 'oc' do |spec|

    spec.source_files = "src/oc/*.{h,m}"    
    spec.dependency 'libwebp/core'

  end

end
