## Sinatra SimpleAuth Extension

Sinatra extension with methods and routes for dealing with simple, single-password authorization

## Installation

    sudo gem install sinatra-simple-auth

Or via bundler:

    gem 'sinatra-simple-auth'

## Usage (classic style applications)

    # classic_app.rb
    require 'rubygems'
    require 'sinatra'
    require 'sinatra/simple_auth'

    enable :sessions
    set :password, 'my_cool_password' # set the password
    set :home, '/secure/' # where user should be redirected after successful authentication

    get '/login/?' do
      erb :login # page with auth form
    end

    get '/secure/' do
      protected! # protected route, requires auth
      erb :secure
    end

    get '/' do
      if authorized? # helper method
        "Hello, %username%"
      else
        "Not authorized"
      end
    end

## Usage (modular style applications)

    # modular_app.rb
    require 'sinatra/base'
    require 'sinatra/simple_auth'

    class SinatraModularApp < Sinatra::Base
      enable :sessions
      register Sinatra::SimpleAuth

      set :password, 'hello' # set the password
      set :home, '/' # where user should be redirected after successful authentication

      get '/login/?' do
        erb :login # page with auth form
      end

      get '/secure/' do
        protected! # protected route, requires auth
        erb :secure
      end

      get '/' do
        if authorized? # helper method
          "Hello, %username%"
        else
          "Not authorized"
        end
      end
    end
