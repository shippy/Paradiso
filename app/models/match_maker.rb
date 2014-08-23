require 'rgl/adjacency'
require 'pry'
module MatchMaker
	def self.findAllSolutions(requests)
		# create graph (edges) based on requests (Request objects)
		graph = RGL::DirectedAdjacencyGraph.new()

		studentHash = {}
		requestHash = {}
		courseHash = {}

		requests.each do |request|
			graph.add_edge(request.original_section_id, request.target_section_id)
			courseHash[[request.original_section_id, request.target_section_id]] = request.course_id
			studentHash[[request.original_section_id, request.target_section_id]] = request.student_id
			requestHash[[request.original_section_id, request.target_section_id]] = request.id
		end

		cycles = graph.cycles()
		cycle_index = {}

		one_cycles = []
		i = 0
		cycles.each do |cycle|
			one_cycles.push([cycle])
			cycle_index[cycle] = i
			i += 1
		end

		all_cycles = [one_cycles]

		two_cycles = []
		i = 0
		while i < cycles.length-1 do
			j = i+1
			while j < cycles.length do
				if (validCycles(cycles[i], cycles[j], studentHash, courseHash) == true)
					two_cycles.push([cycles[i], cycles[j]])
				end
				j += 1
			end
			i += 1
		end

		all_cycles.push(two_cycles)
		do_break = false
		while do_break == false
			do_break = true
			next_level = []
			last_level = all_cycles[all_cycles.length-1]
			last_level.each do |cycle_list|
				start_index = cycle_index[cycle_list[cycle_list.length-1]]+1
				i = start_index
				can_add = true
				while i < cycles.length do
					# j is the index in cycle_list
					j = 0
					while j < cycle_list.length do
						unless two_cycles.include? [cycle_list[j], cycles[i]]
							can_add = false
							break
						end
						j += 1
					end

					if can_add == true
						holder = cycle_list.dup.push(cycles[i])
						next_level.push(holder)
						do_break = false
					end
					i += 1
				end
			end
			all_cycles.push(next_level)
		end

		return [all_cycles, requestHash]
	end

	def self.findBestSolution (requests)
		all_cycles, requestHash = findAllSolutions(requests)

		length_solutions = []

		all_cycles.each do |cycles_list|
			to_append = []
			cycles_list.each do |cycles|
				total = 0
				cycles.each do |cycle|
					total += cycle.length
				end
				to_append.push(total)
			end
			length_solutions.push(to_append) unless to_append.empty?
		end

		

		length_index = []

		length_solutions.each do |lengths|
			max_so_far = 0
			max_indices = []
			i = 0
			while i < lengths.length do
				if lengths[i] > max_so_far
					max_so_far = lengths[i]
					max_indices = []
				end
				if lengths[i] == max_so_far
					max_indices.push(i)
				end
				i += 1

			end

			length_index.push([max_so_far, max_indices])

		end



		max_total = 0
		best_indices = []

		i = 0
		while i < length_index.length do
			if length_index[i][0] > max_total
				max_total = length_index[i][0]
			end

			if length_index[i][0] == max_total
				length_index[i][1].each do |single_index|
					best_indices.push([i, single_index])
				end
			end
			i += 1

		end

		# now you have all of the best solutions
		# find the complement set - set of request_ids not accounted for
		# find the times of all students in the complement
		# find the latest time of all student times in the complement

		all_request_values = requestHash.values()

		fulfilled_values = []

		best_indices.each do |new_index|
			to_append = []
			cycle_solution = all_cycles[new_index[0]][new_index[1]]
			cycle_solution.each do |single_cycle|
				i = 0
				while i < single_cycle.length do
					to_append.push(requestHash[[single_cycle[i], single_cycle[(i+1)%single_cycle.length]]])
					i += 1
				end
			end
			fulfilled_values.push(to_append)

		end

		complement_values = []
		fulfilled_values.each do |fulfilled_value|
			complement_values.push(all_request_values-fulfilled_value)
		end

		earliest_times = []


		complement_values.each do |complement_value|
			all_times = []
			complement_value.each do |value|
				all_times.push(Request.find(value).created_at)
			end
			earliest_times.push(all_times.min)
		end

		binding.pry

		return fulfilled_values[earliest_times.index(earliest_times.max)]

	end

	def self.validCycles (cycle1, cycle2, studentHash, courseHash)
		# all_edges is the list of all student IDs from all edges in cycle1, cycle2
		all_edges = []
		i = 0
		while i < cycle1.length do
			all_edges.push([studentHash[[cycle1[i],cycle1[(i+1)%cycle1.length]]], courseHash[[cycle1[i], cycle1[(i+1)%cycle1.length]]]])
			i += 1
		end

		i = 0
		while i < cycle2.length do
			all_edges.push([studentHash[[cycle2[i],cycle2[(i+1)%cycle2.length]]], courseHash[[cycle2[i], cycle2[(i+1)%cycle2.length]]]])
			i += 1
		end

		if all_edges.uniq.length == all_edges.length
			return true
		else
			return false
		end

	end
end