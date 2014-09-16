require 'open3'
module Synkronos
  class Rsync
    def self.sync(src, dest, ssh, port = 22) 
      cmd = "rsync -a #{ssh ? "-e 'ssh -p #{port}'" : nil} #{src} #{dest}"
      Open3.popen3('rsync') do |_, _, stderr, wait_thr|
        puts stderr.read unless wait_thr.value.success? 
      end
    end
  end
end