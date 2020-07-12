class CustomAuthenticationFailure < Devise::FailureApp
  protected

  def redirect_url
    # super
    account_signin_path
  end
end
