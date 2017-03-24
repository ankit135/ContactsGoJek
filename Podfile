# Uncomment this line to define a global platform for your project
platform :ios, "9.0"

target 'ContactsGoJek' do
   use_frameworks!
   pod 'Alamofire', '~> 4.4'
   end


  target 'ContactsGoJekTests' do
    inherit! :search_paths
    use_frameworks!
    pod 'Alamofire', '~> 4.4'
  end

  target 'ContactsGoJekUITests' do
    inherit! :search_paths
    use_frameworks!
    pod 'Alamofire', '~> 4.4'
  end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
