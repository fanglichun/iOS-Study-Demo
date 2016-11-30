
import Foundation

func random_uniform(value: Int) -> Int {
  return Int(arc4random_uniform(UInt32(value)))
}

typealias JSONObject = [String: AnyObject]
let file = Bundle.main.path(forResource:"tutorials", ofType: "json")!
let url = URL(fileURLWithPath: file)
let data = try! Data(contentsOf: url)
let json = try! JSONSerialization.jsonObject(with: data) as! [JSONObject]
print(json)

enum Day: Int {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

class Tutorial {
    
    let title: String?
    var day: Day?
    
    init(title: String, day: Day? = nil) {
        self.title = title
        self.day = day
    }
}

extension Tutorial: CustomStringConvertible {
    
    var description: String {
        var scheduled = ", not scheduled"
        if let day = day {
            scheduled = ", scheduled on \(day)"
        }
        return title! + scheduled
    }
}

var tutorials: [Tutorial] = []
for dict in json {
    var currentTitle: String = ""
    var currentDay: Day?
    for (key, value) in dict {
        //To Do
        switch (key , value) {
        case ("Title", is String):
            currentTitle = value as! String
            
        case ("day", let dayString as String):
            if let dayInt = Int(dayString), let day = Day(rawValue: dayInt - 1) {
                currentDay = day
            }
            
        default:
            break
        }
    }
    let currentTutorial = Tutorial(title: currentTitle, day: currentDay)
    tutorials.append(currentTutorial)
}
print("Before:\(tutorials)")
tutorials.forEach { $0.day = nil }
print("After:\(tutorials)")
let days = (0...6).map {
    Day(rawValue: $0)!
}
let randomDays = days.sorted { _ in random_uniform(value: 2) == 0
}
(0...6).forEach {
    tutorials[$0].day = randomDays[$0]
}

print(tutorials)

tutorials.sort {
    
    switch ($0.day, $1.day) {
        
    case (nil, nil):
        return $0.title?.compare($1.title ?? "", options: .caseInsensitive) == .orderedAscending
    
    case (let firstDay?, let secondDay?):
        return firstDay.rawValue < secondDay.rawValue
    
    case (nil, let secondDay?):
        return true
    
    case (let firstDay?, nil):
        return false
    }
}

print(tutorials)

extension Day {
    
    var name: String {
        
        switch  self {
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        case .sunday:
            return "Sunday"
        }
    }
    
    var order: String {
        switch self {
        case .monday:
            return "first"
        case .tuesday:
            return "second"
        case .wednesday:
            return "third"
        case .thursday:
            return "fourth"
        case .friday:
            return "fifth"
        case .saturday:
            return "sixth"
        case .sunday:
            return "seventh"
        }
    }
}

func ~=(lhs: Int, rhs: Day) ->Bool {
    return lhs == rhs.rawValue + 1
}


extension Tutorial {
    
    var order: String {
        guard let day = day else {
            return "not scheduled"
        }
        switch day {
        case 1:
            return "first"
        case 2:
            return "second"
        case 3:
            return "third"
        case 4:
            return "fourth"
        case 5:
            return "fifth"
        case 6:
            return "sixth"
        case 7:
            return "seventh"
        default:
            fatalError("invalid day value")
        }
    }
}

for (index, tutorial) in tutorials.enumerated() {
    
    guard let day = tutorial.day else {
        print("\(index + 1). \(tutorial.title) is not scheduled this week.")
        continue
    }
    print("\(index + 1). \(tutorial.title) is scheduled on \(day.name). It's the \(tutorial.order) tutorial of the week.")

}




















