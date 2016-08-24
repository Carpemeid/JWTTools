Pod::Spec.new do |s|

s.name         = "JWTTools"
s.version      = "1.2"
s.summary      = "JWTTools allows verifying and getting the payload of JWT tokens"
s.homepage = "https://github.com/Carpemeid/JWTTools"
s.license      = { type: 'MIT', file: 'Metadata/LICENSE' }

s.author             = { "Carpemeid" => "andonidan@yahoo.com" }
s.platform     = :ios, "8.3"

s.source       = { :git => "https://github.com/Carpemeid/JWTTools.git", :branch => 'master', :tag => "#{s.version}"}

s.source_files  = "JWTTools", "JWTTools/**/*.{swift,plist,h,m}"

s.framework  = "Heimdall"

s.requires_arc = true

s.dependency 'Heimdall', '~> 1.0'

end