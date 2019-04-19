class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where(email: params[:session][:email], password: params[:session][:password])[0]
		if user
			flash[:notice] = "Welcome " + user[:name] + "!"
			cookies[:logged_user] = user
			redirect_to "/users/" +String(user.id)
		else
			flash[:alert] = "Email or password is invalid"
			redirect_to root_url
		end
	end

	def destroy
		cookies[:logged_user] = nil
		redirect_to root_url
	end

	private

	def session_params
		params.require(:user).permit(:email, :password)
	end

end
