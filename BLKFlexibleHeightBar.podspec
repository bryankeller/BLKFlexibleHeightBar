Pod::Spec.new do |s|
  s.name     = 'BLKFlexibleHeightBar'
  s.version  = '1.0.2'
  s.license  = { :type => 'MIT', :file => 'LICENSE.md' }
  s.summary  = "A library for creating condensing header bars like those seen in the Facebook, Square Cash, and Safari iOS apps."
  s.homepage = 'https://github.com/bryankeller/BLKFlexibleHeightBar/'
  s.authors  = { 'Bryan Keller' => 'kellerbryan19@gmail.com' }
  s.social_media_url = "https://twitter.com/BKyourway19"
  s.source   = { :git => 'https://github.com/bryankeller/BLKFlexibleHeightBar.git', :tag => s.version.to_s }
  s.source_files = 'BLKFlexibleHeightBar/*.{h,m}'
  s.requires_arc = true
  s.platform = :ios
  s.platform = :ios, '6.0'
end
