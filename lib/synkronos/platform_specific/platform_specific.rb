Synk = case RUBY_PLATFORM
when /darwin/
  require_relative('platforms/darwin')
  FSEvent
when /linux/
  require_relative('platforms/linux')
  INotify::Notifier
end