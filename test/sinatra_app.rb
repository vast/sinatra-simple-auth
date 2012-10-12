require 'rubygems'
require 'sinatra'
require './lib/sinatra/simple_auth'


set :password, 'hello'
set :home, '/secret/'

get '/' do
  "hello, i'm root"
end

get '/public' do
  if authorized?
    "hello, %username%"
  else
    "Please login"
  end  
end

get '/pvt' do
  protected!
  "private area"
end