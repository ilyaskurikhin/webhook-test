require 'sinatra'
require 'json'
require 'git'
require 'rubygems'


post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"
  g = Git.open(Dir.pwd, :log => Logger.new(STDOUT))
  g.pull
end

