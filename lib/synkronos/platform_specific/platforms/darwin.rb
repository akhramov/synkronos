require 'rb-fsevent'
class FSEvent
  def eye(src, &block)
    watch(src, {latency: 1}, &block)
  end
end