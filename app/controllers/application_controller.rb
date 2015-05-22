class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #skip_before_filter :verify_authenticity_token
   protect_from_forgery with: :null_session

  def success_hash
    {success: true}
  end

  def record_not_found
    {error: 'Record not found'}
  end

end
