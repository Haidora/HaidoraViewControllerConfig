Pod::Spec.new do |s|
  s.name             = "HaidoraViewControllerConfig"
  s.version          = "0.1.0"
  s.summary          = "ViewController一些常用配置."
  s.description      = <<-DESC
                       ViewController一些常用配置.(背景,布局等)
                       DESC
  s.homepage         = "https://github.com/Haidora/HaidoraViewControllerConfig"
  s.license          = 'MIT'
  s.author           = { "mrdaios" => "mrdaios@gmail.com" }
  s.source           = { :git => "https://github.com/Haidora/HaidoraViewControllerConfig.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.dependency "Aspects"
end
