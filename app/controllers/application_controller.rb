class ApplicationController < ActionController::Base
  layout 'application'
  include Pundit::Authorization
end
