class SessionsController < ApplicationController
	def new
	end

	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			redirect_to(session[:intended_url] || user, notice: "Welcome back, #{user.name}!")
			session[:intended_url] = nil
		else
			flash.now[:alert] = "Invalid email/password combination!"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "You have successfully signed out!"
	end
end
