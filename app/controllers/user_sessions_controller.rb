class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  layout "login"

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password])
      redirect_to("/", notice: 'Успешный вход')
    else
      flash.now[:alert] = 'Повторите попытку'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to("/login", notice: 'Вы вышли')
  end
end