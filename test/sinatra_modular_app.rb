require 'sinatra/base'
require './lib/sinatra/simple_auth'

class SinatraModularApp < Sinatra::Base
  enable :sessions
  register Sinatra::SimpleAuth
  
  set :password, 'hello'
  set :home, '/'

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
end