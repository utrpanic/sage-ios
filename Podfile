platform :ios, '11.0'
use_frameworks!

target 'Sage' do
    source 'https://github.com/CocoaPods/Specs.git'
    pod 'Alamofire'
    pod 'AlamofireImage'
    #pod 'Crashlytics'
    #pod 'Fabric'
end

target 'SageTests' do

end

target 'SageUITests' do

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

