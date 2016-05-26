module ElevatorDevices
	module Monitor
		class InsideMonitor < BasicMonitor
			attr_accessor :processor, :floor_number

			def say_wait_for_elevator(current_floor)
				wait_time = (current_floor-floor_number)*20;
				puts "Your floor: #{floor_number}\nWait #{wait_time} seconds"
			end
		end
	end
end