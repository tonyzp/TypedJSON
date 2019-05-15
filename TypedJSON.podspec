Pod::Spec.new do |s|
  s.name             = 'TypedJSON'
  s.version          = '0.1.0'
  s.summary          = 'A type safe way to access value in Objective-c JSON dictionary.'
  s.description      = 'A type safe way to access value in Objective-c JSON dictionary.'
  s.homepage         = 'https://github.com/tonyzp/TypedJSON'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tp' => 'peng.zhang@56qq.com' }
  s.source           = { :git => 'git@github.com:tonyzp/TypedJSON.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'TypedJSON/Classes/**/*.{h,m}'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.test_spec 'Tests' do |ts|
    ts.source_files = 'TypedJSON/Tests/**/*.{h,m}'
    ts.dependency 'Kiwi'
  end
end
