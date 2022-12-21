# Uncomment the next line to define a global platform for your project
 platform :ios, '12.0'

use_frameworks!
workspace 'getgo.xcworkspace'

def apps_core_pod
  # Pods for AppsCore
end

target 'getgo' do
  apps_core_pod
  pod 'SDWebImage'
end

target 'AppsCore' do
  project 'AppsCore/AppsCore.xcodeproj'
  apps_core_pod
end

target 'getgoTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'getgoUITests' do
  # Pods for testing
end
