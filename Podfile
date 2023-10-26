# Uncomment the next line to define a global platform for your project
# platform :ios, '10.0'

target 'Procruited' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Procruited

pod 'DropDown'
pod 'Alamofire','~> 4.7.2'
 pod 'SwiftyJSON'
pod 'CropViewController'
pod 'ADCountryPicker'
pod 'Stripe'
pod 'MBProgressHUD'
pod 'VACalendar'
pod 'TinderSwipeView'
pod 'Kingfisher'
pod 'FTIndicator'
pod 'SVProgressHUD'
pod 'SwiftMessages'
pod 'Toaster'
pod 'YPImagePicker'

end


post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
               end
          end
   end
end
