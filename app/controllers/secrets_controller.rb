class SecretsController < ApplicationController

	#before_action :require_login, only: [:index, :create, :destroy]
  
  def index
  	@secrets = Secret.all
  end

  def new

  end

   def create
    secret = Secret.new(content: secret_params['content'], user: current_user)
    
    flash["success"] = "Secret added!" 
    if secret.save
    redirect_to :back
	end
  end

  def destroy
    secret = Secret.find(params[:id]).destroy

    redirect_to "/users/#{session[:user_id]}"
  end

  private
    
    def secret_params
      params.require(:secret).permit(:content)
    end

end
