class ApplicationController < ActionController::Base
  class Unauthorized < StandardError; end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  include Concerns::Errors

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  rescue_from StandardError do |e|
    error(e)
  end

  rescue_from Unauthorized do |e|
    e.message ||= 'You do not have access to this ressource'
    error(e, 403)
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    error(e, 404)
  end
end
