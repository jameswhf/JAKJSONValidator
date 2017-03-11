Pod::Spec.new do |s|
  s.name         = "JAKJSONValidator"
  s.version      = "0.0.2"
  s.summary      = "NSDictionary Extension, include JSONValidate"
  s.homepage     = "https://github.com/jameswhf/JAKJSONValidator" 
  s.license      = "MIT"
  s.author       = { "王贺锋" => "jameswhf@qq.com" }
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/jameswhf/JAKJSONValidator.git", :tag => s.version.to_s }
  s.source_files  = "JAKJSONValidator/*.{h,m}"
  s.dependency "RPJSONValidator", "0.2.0"
end
