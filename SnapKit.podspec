Pod::Spec.new do |s|
  s.name = 'SnapKit'
  s.version = '5.0.1'
  s.license = 'MIT'
  s.summary = 'Harness the power of auto layout with a simplified, chainable, and compile time safe syntax.'
  s.homepage = 'https://github.com/SnapKit/SnapKit'
  s.authors = { 'Robert Payne' => 'robertpayne@me.com' }
  s.social_media_url = 'http://twitter.com/robertjpayne'
  s.source = { :git => 'https://github.com/SnapKit/SnapKit.git', :tag => '5.0.1' }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'

  s.source_files = 'Source/*.swift'

  s.swift_version = '5.0'
end
