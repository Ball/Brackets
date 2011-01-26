def refresh(filename)
  require 'socket'
  app = "bracket.#{Socket.gethostname}"
  puts "#{filename} changed, refreshing '#{app}'"
  system("autorefresh #{app}")
end

watch ('public/stylesheets/.*css') {|m| refresh(m)}
watch ('app/views/.*\.haml') {|m| refresh(m)}
