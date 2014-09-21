require 'rb-inotify'
class INotify::Notifier
  def eye(src, &block)
    watch(src, :all_events, :recursive, &block)
  end
end