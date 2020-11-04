class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = t "account_control.success"
      redirect_to user
    else
      flash[:danger] = t "account_control.danger"
      redirect_to root_url
    end
  end
end
