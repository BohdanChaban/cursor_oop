module ElevatorDevices
	class Elevator
		attr_accessor :processor

		def initialize (processor)
			self.processor = processor
		end	

		def control
			self.processor.control 
		end

		def monitor
			self.processor.monitor 
		end

		def state
			puts "Elevator floor: #{self.processor.floor}\nTotal persons: #{self.processor.person_counter}\nWorking engines: #{self.processor.engine}"
		end
	end
end