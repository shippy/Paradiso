class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter CASClient::Frameworks::Rails::Filter, :unless => :skip_login?
  before_filter :current_user

  #so we can use current_user in the views
  helper_method :current_user

  def current_user
    current_user = Student.find_or_create_by( netid: session[:cas_user] )
    if !current_user
      redirect_to :root
      return false
    end
  end


  # hack for skip_before_filter with CAS
  # overwrite this method (with 'true') in any controller you want to skip CAS
  def skip_login?
    false
  end
end
