class UsersController < ApplicationController
	
	def show

		@user = User.find(params[:id])

	end
	
	def authenticate_user
   unless current_user
      flash[:danger] = "Veuillez-vous connecter pour accéder au contenu."
   redirect_to new_user_session_path
    end
    end
	
	
def edit
	@user = User.find(params[:id])
end
	
	
def update
  @user = User.find(params[:id])
	user_params = params.require(:user).permit(:first_name, :last_name, :description)
	if @user.update(user_params)
		flash[:success] = "Ton profil est modifié"
    redirect_to user_path(:id => current_user.id)
  else
    render :edit
  end
end
	

end
