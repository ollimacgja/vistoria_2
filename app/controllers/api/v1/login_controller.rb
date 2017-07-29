class Api::V1::LoginController < Api::V1::BaseController

  def create
    user = User.find_by_email(login_params[:email])
    if user && user.valid_password?(login_params[:password])
      render json: user
    else
      render json: 'Email ou senha inválido'
    end
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)

  end
end