class ResultsController < ApplicationController
	def temperature
		@temps = []
		Result.where(kind: "temperature").each {|ele| @temps << ele.value }

		g = Gruff::Line.new
		g.title = "A Line Graph"
		g.data 'Fries', [20, 23, 19, 8]
		g.data 'Hamburgers', [50, 19, 99, 29]
		g.write("test/output/line.png")
	end
end
