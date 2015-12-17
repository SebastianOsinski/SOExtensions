Pod::Spec.new do |s|
    s.name                      = "SOExtensions"
    s.version                   = "1.0.0"
    s.summary                   = "Collection of useful extensions for Swift"
    s.homepage                  = "https://github.com/SebastianOsinski/SOExtensions"
    s.license                   = { :type => "MIT", :file => "LICENSE.md" }
    s.author                    = "Sebastian Osiński"
    s.ios.deployment_target     = "8.0"
    s.osx.deployment_target     = "10.9"
    s.watchos.deployment_target = '2.0'
    s.tvos.deployment_target    = '9.0'
    s.source                    = { :git => "https://github.com/SebastianOsinski/SOExtensions.git", :tag => s.version.to_s }
    s.source_files              = "SOExtensions/**/*.swift"
end
