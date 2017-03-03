abstract_target 'Abstract' do
  use_frameworks!

  def main
    pod 'SwiftLint'
    pod 'Kingfisher', '~> 3.0'
  end

  target 'AoiSearch' do
    main
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end
end
