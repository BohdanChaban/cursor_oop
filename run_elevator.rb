load 'elevator_setup.rb'

elevator_setup = ElevatorSetup.new
elevator = elevator_setup.elevator

elevator.state()


# Enter command "elevator.control.floor_operation(floor, change_person)"
elevator.control.floor_operation(3, +2)
elevator.control.floor_operation(6, +2)
elevator.control.floor_operation(1, -4)