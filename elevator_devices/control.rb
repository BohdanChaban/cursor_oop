module ElevatorDevices
	class Control
		attr_accessor :processor

		private

		def run_engine
			self.processor.engine = 2
			puts "Elevator: floor - #{self.processor.floor} [Turn on second engine]"
		end

		def stop_engine
			self.processor.engine = 1
			puts "Elevator: floor - #{self.processor.floor} [Turn off second engine]"
		end

		public

		def floor_operation(floor, person_change)
			self.processor.floor = floor
			persons_before = self.processor.person_counter
			self.processor.person_counter += person_change.to_i
			puts "Elevator: floor - #{floor} [Door open]"
			puts "Elevator: floor - #{floor} [Total persons: #{self.processor.person_counter}]"
			puts "Elevator: floor - #{floor} [Door close]"
			if (persons_before <= 3 && self.processor.person_counter > 3)
				run_engine()
			end
			if (persons_before > 3 && self.processor.person_counter <= 3)
				stop_engine()
			end
		end
	end
end