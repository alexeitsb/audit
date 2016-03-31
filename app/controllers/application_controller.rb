class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Include some helpers.
  include UserHelper
  include ModelHelper

  # Add root breadcrumbs.
  before_action { breadcrumbs.add "Início", root_path }

  # Check if requested action is create.
  def create?
    params[:action] == "create"
  end

  # Check if requested action is update.
  def update?
    params[:action] == "update"
  end
end
