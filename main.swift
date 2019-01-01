// Object oriented program to display the current local time on a 4-digit 7-segment LED display

// initialize the display
// configured as TimeDisplay, child of the generic object Display, which can display any numbers and dots on the display

let display = TimeDisplay()

// method TimeDisplay.show (override from Display.show defines the program loop (while true) and contains the program logic, here to display the local current time)

display.show()




