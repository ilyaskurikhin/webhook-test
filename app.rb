require 'sinatra'
require 'json'
require 'git'


post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"
  g = Git.open(working_dir, :log => Logger.new(STDOUT))
  g.pull
end

