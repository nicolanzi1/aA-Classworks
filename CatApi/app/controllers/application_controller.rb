class ApplicationController < ActionController::Base
    protect_from_forgery except: ['action_name']
end
