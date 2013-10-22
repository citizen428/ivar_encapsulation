Gem::Specification.new do |gem|
  gem.name = 'ivar_encapsulation'
  gem.version = '1.0.0'
  gem.author = 'Michael Kohl'
  gem.email = 'citizen428@gmail.com'
  gem.summary = 'Better encapsulation for instance variables'
  gem.description = 'Provides similar functionality to the attr_* methods, but can also generate private getter/setter methods for class internal use.'
  gem.homepage = 'https://github.com/citizen428/ivar_encapsulation'
  gem.license = 'MIT'
  gem.require_paths = %w[lib]
  gem.files = Dir['Gemfile', 'LICENSE', 'README.markdown', 'doc/**/*', 'lib/*', 'test/*']
end
