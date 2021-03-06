require 'optparse'

module Synkronos
  class OptionsParser
    def self.parse(args)
      options = {}
      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: synkronos [options]"
        opts.separator ""
        opts.separator "Required args"
        
        opts.on("-s", "--src PATH", "PATH of the source directory") { |path| options[:src] = path }
        opts.on("-d", "--dest PATH", "PATH of the destination directory") { |path| options[:dest] = path }
        
        opts.separator ""
        opts.separator "SSH args"
        opts.on("--[no-]ssh", "Whether we use ssh or not") { |v| options[:ssh] = v }
        opts.on("-p", "--port NUMBER", "ssh port NUMBER (defaults to 22)") { |v| options[:port] = v }
        
        
        opts.separator "Common options"
        opts.separator "SSH args"
        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        opts.on_tail('-v', "--version", "Show version") do
          puts VERSION
          exit
        end
      end

      opt_parser.parse!(args)
      abort "You must provide source and destination path" unless options[:src] or options[:dest]
      options
    end
  end 
end