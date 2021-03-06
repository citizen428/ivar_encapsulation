require 'rake/testtask'
require 'rdoc/task'
require 'fileutils'
GEMSPEC = 'ivar_encapsulation.gemspec'

Rake::TestTask.new do |t|
  t.pattern = 'test/test_*.rb'
end

Rake::RDocTask.new do |rd|
  rd.rdoc_dir = 'doc/'
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
  rd.title = 'ivar_encapsulation'

  rd.options << '--line-numbers'
  rd.options << '--all'
end

def gemspec
  @gemspec ||= eval(File.read(GEMSPEC), binding, GEMSPEC)
end

namespace :gem do
  desc "Validate the gemspec"
  task :validate_gemspec do
    gemspec.validate
  end

  desc "Build the gem"
  task :build => :validate_gemspec do
    sh "gem build #{GEMSPEC}"
    FileUtils.mkdir_p 'pkg'
    FileUtils.mv "#{gemspec.name}-#{gemspec.version}.gem", 'pkg'
  end

  desc "Install the gem locally"
  task :install => :build do
    sh "gem install pkg/#{gemspec.name}-#{gemspec.version}.gem"
  end
end

task :default => [:test]
