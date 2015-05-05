Pod::Spec.new do |s|
  s.name = "SnowFalling"
  s.version = "1.0.3"
  s.summary = "Snow Falling effects on UIViewController. Inspired by LINE for iOS on Dec 25."
  s.homepage = 'https://github.com/pixyzehn/SnowFalling'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { "pixyzehn" => "civokjots0109@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source = { :git => "https://github.com/pixyzehn/SnowFalling.git", :tag => "#{s.version}" }
  s.source_files = "SnowFalling/*.swift"
end
