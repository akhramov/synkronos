require "synkronos/version"
require 'synkronos/options'
require 'synkronos/rsync/rsync'
require 'rb-fsevent'

module Synkronos
  def self.run(args)
    opts = OptionsParser.parse(args)
    rsync_args = [opts[:src], opts[:dest], opts[:ssh], opts[:port]]
    Rsync.sync(*rsync_args)
    
    fsevent = FSEvent.new
    fsevent.watch(opts[:src], {latency: 1}) do
      Rsync.sync(*rsync_args)
    end
    fsevent.run
  end
end