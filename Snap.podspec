Pod::Spec.new do |s|
  s.name = 'Snap'
  s.version = '0.0.6'
  s.license = 'MIT'
  s.summary = 'Harness the power of auto layout with a simplified, chainable, and compile time safe syntax.'
  s.homepage = 'https://github.com/Masonry/Snap'
  s.authors = { 'Robert Payne' => 'robertpayne@me.com' }
  s.social_media_url = 'http://twitter.com/robertjpayne'
  s.source = { :git => 'https://github.com/Masonry/Snap.git', :tag => '0.0.6' }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'Snap/*.swift'

  s.requires_arc = true
end