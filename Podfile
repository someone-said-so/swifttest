# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'HydraAsync'
end

target 'swifttest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  common_pods

  # Pods for unittest

  target 'swifttestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'swifttestUITests' do
    # Pods for testing
  end

end
