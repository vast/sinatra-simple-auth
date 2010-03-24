require 'sinatra/base'

module Sinatra
  module SimpleAuth
    module Helpers
      def authorized?
        session[:arni]
      end

      def auth!(password)
        if password == options.password
          session[:arni] = true
          redirect_back_or_default(options.home)
        end
        redirect '/a'
      end

      def logout!
        session.clear
        redirect '/'
      end

      def protected!
        unless authorized?
          store_location
          redirect '/a'
        end
      end

      def store_location
        session[:return_to] = request.fullpath if request.get?
      end

      protected
      def redirect_back_or_default(default)
        if session[:return_to] && session[:return_to] !=~ /^\/a\/?$/
          back = session[:return_to].clone
          session[:return_to] = nil
          redirect back
        end
        redirect default
      end

    end

    def self.registered(app)
      app.helpers SimpleAuth::Helpers

      app.set :password, 'password'
      app.set :home, '/'

      ['/a/?', '/login/?', '/signin/?'].each do |r|
        app.post r do
          auth!(params[:password])
        end
      end

      app.delete '/a/?' do
        logout!
      end

      app.get '/logout/?' do
        logout!
      end
    end

  end

  register SimpleAuth
end