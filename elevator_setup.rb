load 'elevator_devices/elevator.rb'
load 'elevator_devices/processor.rb'
load 'elevator_devices/control.rb'

class ElevatorSetup
	attr_accessor :elevator

	def initialize
		processor = ElevatorDevices::Processor.new
		processor.add_control(ElevatorDevices::Control.new)
		self.elevator = ElevatorDevices::Elevator.new(processor)
	end	
end