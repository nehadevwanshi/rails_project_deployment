class UsersController < ApplicationController
  #before_action :require_login, expect:[:new, :create]

  def show
  	#puts 'this is users controller'
  	#puts params[:id]
  	@user = User.find(params[:id])
 
    @secrets = @user.secrets    
  end

  def new 

  end

  def create

  	@user = User.create user_params

    #@secrets = Secret.create secret_params
  	
  	if @user.valid? 
  		session[:id] = @user.id
  		redirect_to "/users/#{session[:id]}"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to "/users/new"
  	end

  end

  def edit
  	@user = User.find(params[:id])
  end


  def update
  	puts user_params
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.save
      puts @user[:name]
      puts "user updated successfully"
      flash[:success] = " You updated the user uccessfully !"
      redirect_to "/users/#{@user.id}"
    else
      puts "Error while updating user #{@user.errors.full_messages}"
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end  

  def destroy
    user =User.find(params[:id])
    user.destroy
    session[:user_id] =nil
    redirect_to "/sessions/new"
  end           

=begin
	def update
		user = User.find(params[:id])
	    
	    user.update(name: params[:name], email: params[:email]   
    end
=end 

private                               
  	def user_params
  		#puts 'inside user_params'
  		#puts params
  		#user =  params[:user]
  		params.permit(:name, :email, :password, :password_confirmation)

  	end
end
