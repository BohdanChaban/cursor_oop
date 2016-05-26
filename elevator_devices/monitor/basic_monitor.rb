module ElevatorDevices
	module Monitor
		class BasicMonitor

			def say_current_floor(current_floor)
				puts "Elevator: floor - #{current_floor}"
			end
		end
	end
end