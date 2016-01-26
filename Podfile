# Uncomment this line to define a global platform for your project
platform :ios, '9.0'
use_frameworks!

target 'Neos' do
  pod 'Alamofire', '~> 3.1.4'
  pod 'Argo', '~>2.2.0'
  pod 'Curry', '~> 1.4.0'
  pod 'Runes', '~> 3.1.0'
  pod 'Colortools', '0.1.1'
end

def testing_pods
  pod 'Quick', '~> 0.8'
  pod 'Nimble', '~> 3.0.0'
end

target 'NeosTests' do
  testing_pods
end

target 'NeosUITests' do
  testing_pods
end

