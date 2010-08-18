require 'rake'
require 'rake/rdoctask'
require 'spec/rake/spectask'

desc 'Generate documentation for the validates_absence_of plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ValidatesAbsenceOf'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


desc "Run the specs under spec"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/*_spec.rb']
end

desc "Default task is to run specs"
task :default => :spec

