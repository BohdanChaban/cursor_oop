module ElevatorDevices
	module Monitor
		class InsideMonitor < BasicMonitor
			attr_accessor :processor

			def say_on_floor(floor, person_counter)
				puts "Elevator: floor - #{floor} [Door open]"
				puts "Elevator: floor - #{floor} [Total persons: #{person_counter}]"
				puts "Elevator: floor - #{floor} [Door close]"
			end

			def say_run_engine
				puts "Elevator: Turn on second engine"
			end

			def say_stop_engine
				puts "Elevator: Turn off second engine"
			end
		end
	end
end