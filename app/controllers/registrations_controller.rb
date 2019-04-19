class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
		user = User.create(
				name: params[:registrations][:name],
				last_name: params[:registrations][:last_name],
				email: params[:registrations][:email],
				phone: params[:registrations][:phone],
				password: params[:registrations][:password]
		)
		if user.save
			flash[:notice] = "User saved successfully!"
			redirect_to root_url
		else
			flash[:notice] = "Registration error!"
			redirect_to registrations_url
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :last_name, :email, :password, :phone)
	end
end
