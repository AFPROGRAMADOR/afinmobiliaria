 class Users::RegistrationsController < Devise::RegistrationsController
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
