require 'open3'

module Synkronos
  
  #
  # Generates and executes rsync command. If something is going bad
  # exits with a message to stderr.
  # 
  class Rsync
    def self.sync(src, dest, ssh = false, port = 22) 
      src += '/' unless src.end_with?('/')
      cmd = "rsync -a --delete #{ssh ? "-e 'ssh -p #{port}'" : nil} #{src} #{dest}"
      Open3.popen3(cmd) do |_, _, stderr, wait_thr|
        abort(stderr.read) unless wait_thr.value.success? 
      end
    end
  end
end