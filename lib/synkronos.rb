require_relative "synkronos/version"
require_relative 'synkronos/options'
require_relative 'synkronos/rsync/rsync'
require_relative 'synkronos/platform_specific/platform_specific'

module Synkronos
  def self.run(args)
    opts = OptionsParser.parse(args)
    rsync_args = [opts[:src], opts[:dest], opts[:ssh], opts[:port]]
    Rsync.sync(*rsync_args)
    
    event = Synk.new
    event.eye(opts[:src]) do
      Rsync.sync(*rsync_args)
    end
    event.run
  end
end