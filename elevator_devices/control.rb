module ElevatorDevices
	class Control
		attr_accessor :processor, :start_floor, :finish_floor

		def initialize
			@floor_order_up = []
			@floor_order_down = []		
		end
		
		private

		def run_engine
			self.processor.engine = 2
			self.processor.monitor.say_run_engine()
		end

		def stop_engine
			self.processor.engine = 1
			self.processor.monitor.say_stop_engine()
		end

		def between_floor(start_floor, finish_floor)
			if (start_floor < finish_floor)
				((start_floor+1)...finish_floor).each do |current_floor|
					self.processor.monitor.say_current_floor(current_floor)
				end
			else 
				current_floor = start_floor-1
				while (current_floor > finish_floor)
					self.processor.monitor.say_current_floor(current_floor)
					current_floor -= 1
				end
			end
		end

		def floor_operation(floor, person_change)
			start_floor = self.processor.floor
			self.processor.floor = floor
			between_floor(start_floor, self.processor.floor)
			persons_before = self.processor.person_counter
			self.processor.person_counter += person_change.to_i
			self.processor.monitor.say_on_floor(floor, self.processor.person_counter)
			if (persons_before <= 3 && self.processor.person_counter > 3)
				run_engine()
			end
			if (persons_before > 3 && self.processor.person_counter <= 3)
				stop_engine()
			end
		end

		public

		def move(floor, persons, direction)
			@floor_order_up << OrderLogic.new(floor, persons) if direction == 'up'
			@floor_order_down << OrderLogic.new(floor, persons) if direction == 'down'
		end

		def start
			@floor_order_up.sort! {|a,b| a.floor <=> b.floor}
			@floor_order_down.sort! {|a,b| b.floor <=> a.floor}
			@floor_order_up.each do |order|
				floor_operation(order.floor, order.persons)
			end
			@floor_order_down.each do |order|
				floor_operation(order.floor, order.persons)
			end
			floor_operation(1,-self.processor.person_counter)
		end
	end
end