Pod::Spec.new do |s|

  s.name         = "JWTTools"
  s.version      = "1.0"
  s.summary      = "JWTTools allows verifying and getting the payload of JWT tokens"

  s.license      = { type: 'MIT', file: 'Metadata/LICENSE' }

  s.author             = { "Carpemeid" => "andonidan@yahoo.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/Carpemeid/JWTTools.git", :branch => 'master', :tag => "#{spec.version}"}

  s.source_files  = "JWTTools", "JWTTools/*.{swift,plist,h,m}"

  s.framework  = "SwiftyRSA"
  s.requires_arc = true
  s.dependency "SwiftyRSA", "~> 0.4"

end