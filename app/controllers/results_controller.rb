class ResultsController < ApplicationController
	def temperature
		@temps = []
		@user = User.find_by_id(session[:user_id])
		Result.where(kind: "temperature", user_id: @user.id).each {|ele| @temps << ele.value }
		

		g = Gruff::Line.new
		g.title = "Recorded Temperatures"
		g.data 'Temperatures', @temps
		g.reference_lines[:normal_hi] = { :value => 99, :color => 'red' }
		g.reference_lines[:normal_lo] = { :value => 97.8, :color => 'red' }
		g.write("app/assets/images/#{@user.id}_temperatures.png")
	end

	def new
		@result = Result.new
	end

	def create
		params[:result][:kind] = params[:result][:kind].downcase
		result_params = params.require(:result).permit(:kind, :value)

		@result = Result.new(result_params.merge(user_id: session[:user_id]))
    if @result.save
      flash[:notice] = "Successfully saved new result."
      redirect_to user_profile_path
    else
      flash[:error] = @result.errors.full_messages.join(", ")
      redirect_to new_result_path
    end
	end
end
