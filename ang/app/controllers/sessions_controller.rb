class SessionsController < ApplicationController
	def user_sign_in_form
		
	end

	def user_sign_in
		@user = User.find_by(email: params[:user][:email])
			if @user.present? && @user.is_active?
		  		if @user.admin_approved? && User.test_password(params[:user][:password],@user.password)
		    			session[:user_id] = @user.id
		    			flash[:notice]='Logged in successfully'
		  		elsif !@user.admin_approved?
		    			flash[:notice] = 'Your account has not been approved'
		    			render 'user_sign_in_form'
		    	else
		    		  flash[:notice]='Email or Password is invalid'
		    		  render 'user_sign_in_form'
		  		end
		  else
		  	flash[:notice]='Your account does not exist'
		  	render 'user_sign_in_form'
		  end
	end

	def session_destroy
		session[:user_id] = nil
		flash[:notice]='Logged out successfully'
		redirect_to root_url
	end
		
end

#for the basic and real for the pace situation just for testing
