load 'elevator_devices/elevator.rb'
load 'elevator_devices/processor.rb'
load 'elevator_devices/control.rb'
load 'elevator_devices/order_logic.rb'
load 'elevator_devices/monitor/basic_monitor.rb'
load 'elevator_devices/monitor/inside_monitor.rb'
load 'elevator_devices/monitor/floor_monitor.rb'

class ElevatorSetup
	attr_accessor :elevator

	def initialize
		processor = ElevatorDevices::Processor.new
		processor.add_control(ElevatorDevices::Control.new)
		processor.add_monitor(ElevatorDevices::Monitor::InsideMonitor.new)
		self.elevator = ElevatorDevices::Elevator.new(processor)
	end	
end