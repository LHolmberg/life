import Foundation

extension Date {
    private struct Holder {
        static let weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    }
    func getCurrentDate() -> String {
        let calendar = Calendar.current
        let date = Date()
        return String(calendar.component(.day, from: date)) + "/" + String(calendar.component(.month, from: date)) +
            "/" + String(calendar.component(.year, from: date))
    }
    func getCurrentWeekday() -> String {
        return Holder.weekdays[dayNumberOfWeek()-1]
    }
    func dayNumberOfWeek() -> Int! {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
