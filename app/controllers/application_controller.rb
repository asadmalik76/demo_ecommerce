# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  layout 'application'
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError do |_exception|
    redirect_to unauthorized_path
  end
end
