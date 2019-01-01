// generic display class to make use of a 4-digit 7-segment LED display
// the output is definend in the method "show", which needs override for the current project

import SwiftyGPIO
import Foundation

let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPi3)

class Display {

	let segments = 0...6
	let positions = 0...3

	let digits=[[0,0,0,0,0,0,1],
				[1,0,0,1,1,1,1],
				[0,0,1,0,0,1,0],
				[0,0,0,0,1,1,0],
				[1,0,0,1,1,0,0],
				[0,1,0,0,1,0,0],
				[0,1,0,0,0,0,0],
				[0,0,0,1,1,1,1],
				[0,0,0,0,0,0,0],
				[0,0,0,0,1,0,0]]
				
	let segmentGpios = [gpios[.P11]!,
						gpios[.P4]!,
						gpios[.P23]!,
						gpios[.P8]!,
						gpios[.P7]!,
						gpios[.P10]!,
						gpios[.P18]!,]	

	let flashingDot = gpios[.P25]!

	let digitGpios = [gpios[.P22]!,
					  gpios[.P27]!,
					  gpios[.P17]!,
					  gpios[.P24]!]			

	init()
	{
		for segment in segments 
		{
			segmentGpios[segment].direction = .OUT
			segmentGpios[segment].value = 1
		}

		flashingDot.direction = .OUT
		flashingDot.value = 1
	
		for position in positions 
		{
			digitGpios[position].direction = .OUT
			digitGpios[position].value = 0
		}
	}
	
	func displayDigit (position: Int, digit: Int, dotState: Int) 
	{
				
		for segment in segments {
			segmentGpios[segment].value = digits[digit][segment] 
		}
			
		flashingDot.value = dotState
				
		digitGpios[position].value = 1	
		usleep(5)
		digitGpios[position].value = 0	
			
	}
	
	func show()
	{
		while true 
		{
			for position in positions {
				displayDigit (position: position, digit: (position+1), dotState: 0) 
			}
		}
	}			
}


