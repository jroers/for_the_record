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
	end

	def create
	end
end
