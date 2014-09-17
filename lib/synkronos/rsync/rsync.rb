require 'open3'
module Synkronos
  class Rsync
    def self.sync(src, dest, ssh = false, port = 22) 
      src += '/' unless src.end_with?('/')
      cmd = "rsync -a --delete #{ssh ? "-e 'ssh -p #{port}'" : nil} #{src} #{dest}"
      Open3.popen3(cmd) do |_, _, stderr, wait_thr|
        puts stderr.read and exit(1) unless wait_thr.value.success? 
      end
    end
  end
end