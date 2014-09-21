require 'rubygems/command.rb'
require 'rubygems/dependency_installer.rb' 
begin
  Gem::Command.build_args = ARGV
  rescue NoMethodError
end 
inst = Gem::DependencyInstaller.new
begin
  case RUBY_PLATFORM
  when /darwin/
    darwin_gem = ['rb-fsevent', '>= 0.9.4']
    inst.install(*darwin_gem) unless Gem::Specification::find_all_by_name(*darwin_gem).any?
  when /linux/
    linux_gem = ['rb-inotify', '>= 0.9.5']
    inst.install(*linux_gem) unless Gem::Specification::find_all_by_name(*linux_gem).any?
  end
end  

f = File.open(File.join(File.dirname(__FILE__), "Rakefile"), "w")   # create dummy rakefile to indicate success
f.write("task :default\n")
f.close