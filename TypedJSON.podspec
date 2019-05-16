Pod::Spec.new do |s|
  s.name             = 'TypedJSON'
  s.version          = '1.1.0'
  s.summary          = 'A type safe way to access value in Objective-c JSON dictionary.'
  s.description      = 'A type safe way to access value in Objective-c JSON dictionary.'
  s.homepage         = 'https://github.com/tonyzp/TypedJSON'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tp' => 'pzhang0414@gmail.com' }
  s.source           = { :git => 'https://github.com/tonyzp/TypedJSON.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'TypedJSON/Classes/**/*.{h,m}'
  s.public_header_files = 'TypedJSON/Classes/**/*.h'
  s.test_spec 'Tests' do |ts|
    ts.source_files = 'TypedJSON/Tests/**/*.{h,m}'
    ts.dependency 'Kiwi'
  end
end
