load 'elevator_setup.rb'

elevator_setup = ElevatorSetup.new
elevator = elevator_setup.elevator

elevator.state()

u = 'up'
d = 'down'

# Enter command "elevator.control.move(floor, change_person, direction(u or d))"
elevator.control.move(3, +2, u)
elevator.control.move(13, +2, d)
elevator.control.move(7, +4, u)
elevator.control.move(16, -3, d)
elevator.control.move(8, -1, d)
elevator.control.move(14, -2, u)

elevator.control.start()