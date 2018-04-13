# Uncomment the next line to define a global platform for your project
platform :ios, '9.2'

target 'Neos' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  
  # Pods for Neos
  pod 'Alamofire', '~> 4.6.0' 
  pod 'AppCenter'
  pod 'AppCenter/Distribute'

  target 'NeosTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NeosUITests' do
    inherit! :search_paths
    use_frameworks!
    pod 'AppCenterXCUITestExtensions'
  end

end

plugin 'cocoapods-keys', {
  :project => "Neos",
  :keys => [
    "AppCenterSecret"
  ]
}

post_install do |installer|
  installer.aggregate_targets.each do |aggregate_target|
    aggregate_target.xcconfigs.each do |config_name, config_file|
      # puts config_name
      # config_file.attributes.each do |key, value|
      #   puts "Key #{key}"
      #   puts "Value #{value}"
      # end
      config_file.attributes['AC_SECRET'] = ENV['AppCenterSecret']
      xcconfig_path = aggregate_target.xcconfig_path(config_name)
      config_file.save_as(xcconfig_path)
    end
  end
end