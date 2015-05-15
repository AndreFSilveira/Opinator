class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def success_hash
    {success: true}
  end

  def record_not_found
    {error: 'Record not found'}
  end

end
