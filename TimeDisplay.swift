// class TimeDisplay defines the program loop (while true), gets the time from localtime struct formatted as array of Int
// each of the first four digits of the timestring that is stored in "time" is copied to the corresponding position in the display
// the flashing dot appears after the second digit (position 1) and is calculated as seconds mod 2, so that it is on in off and on in even seconds

class TimeDisplay: Display {
	
	override func show() {
		
		while true {
	
			let localTime = LocalTime()
			let time = localTime.formatted()
						
			for position in positions {
				var dotState = 1
				if position == 1 {
					dotState = time[5] % 2
				} 
				else { 
					dotState = 1 
				}
				
			displayDigit (position: position, digit: time[position], dotState: dotState)
			}
		}
	}
}
