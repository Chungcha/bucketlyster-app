class UsersController < ApplicationController

	def home
	end

	def index
	  @users = User.all
	end 
	
	def show
		@user = User.find(params[:id])
  	end

	def new

	end

	def create
		@user = User.new(user_params)
    if @user.save
			return redirect_to controller: 'users', action: 'new' unless @user.save
			session[:user_id] = @user.id
			redirect_to controller: 'welcome', action: 'home'
    else
      render :new
		end
	end

	def edit
		# byebug
	end

	def update
    if @user.update(user_params)
	    redirect_to user_path(@user)
    else 
      render :edit
    end
	end

	def destroy
		current_user.destroy
	  redirect_to users_path
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation, :fullname, :age, :gender, lists_attributes: [:title, :creator_id])
	end

end
