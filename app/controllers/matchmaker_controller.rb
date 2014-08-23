class MatchmakerController < ApplicationController
	include MatchMaker
	def swap
		requests = Request.where(active: true)
		suggested = MatchMaker::findBestSolution(requests) #returns list of request IDs

		suggested.each do |request_id|
			request = Request.find(request_id)
			
			student = request.student
			section = request.original_section
			record = Attendance.where(student: student, section: section).first

			record.update_attributes(section: request.target_section)
			# TODO: transaction each closed graph / the entire solution
			request.active = false

			request.save
		end
		redirect_to 'requests#index'
	end

end
