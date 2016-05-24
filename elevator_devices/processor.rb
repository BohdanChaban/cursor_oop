module ElevatorDevices
	class Processor
		attr_accessor :person_counter, :floor, :engine, :control

		def initialize 
			self.floor = 1
			self.person_counter = 0
			self.engine = 1
		end	

		def add_control(control)
			self.control = control
			control.processor = self
		end
	end
end