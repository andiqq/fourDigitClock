import Foundation

struct LocalTime {
	private let homeTimeZone = "CET"
	private let timeDigits = 0...5
	private let date = Date()
	let formatter = DateFormatter()
	
	init() {
		formatter.timeZone = TimeZone(abbreviation: homeTimeZone)!
		formatter.dateFormat = "HHmmss"
	}
	
	func formatted() -> [Int]
	{
		let timeStringArray = Array(String(formatter.string(from: date)))
		var digitInts: [Int] = []	
		for timeDigit in timeDigits {
			digitInts.append(Int(String(timeStringArray[timeDigit]))!) }
	
		return (digitInts)
	} 		
}
