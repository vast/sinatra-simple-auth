require 'sinatra/base'

module Sinatra
  module SimpleAuth
    module Helpers
      def authorized?
        session[:arni]
      end

      def auth!(password)
        if password == settings.password
          session[:arni] = true
          redirect_back_or_default(settings.home)
        end
        redirect '/login'
      end

      def logout!
        session.clear
        redirect '/'
      end

      def protected!
        unless authorized?
          store_location
          redirect '/login'
        end
      end

      def store_location
        session[:return_to] = request.fullpath if request.get?
      end

      protected
      def redirect_back_or_default(default)
        if session[:return_to] && session[:return_to] !=~ /^\/login\/?$/
          redirect session.delete(:return_to)
        end
        redirect default
      end

    end

    def self.registered(app)
      app.helpers SimpleAuth::Helpers

      app.set :password, 'password'
      app.set :home, '/'

      app.post '/login/?' do
        auth!(params[:password])
      end

      app.delete '/logout/?' do
        logout!
      end

      app.get '/logout/?' do
        logout!
      end
    end

  end

  register SimpleAuth
end