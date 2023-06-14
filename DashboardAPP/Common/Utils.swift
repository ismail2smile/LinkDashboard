//
//  Utils.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//
import UIKit
enum DateDisplayFormat: String{
    case today
    case expired
    case nextDay
}
class Utils {
    
    static func showAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func getDateStringFromDate(dateString:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Specify the input format
        let date = dateFormatter.date(from: dateString)

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd MMM yyyy" // Specify the output format
        return outputDateFormatter.string(from: date!)
    }
    static func getTimeStringFromDate(date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
    static func chartDateConvert(dateString:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "MMM"
            
            let formattedDate = outputDateFormatter.string(from: date)
            return formattedDate
        } else {
            return dateString
        }
    }
    
    static func compareDate(itemDate:Date)-> DateDisplayFormat{
        
        let currentDate = Date()
        let calendar = Calendar.current
        let isSameDay = calendar.isDate(itemDate, inSameDayAs: currentDate) // Check if itemDate is on the same day as currentDate

        if itemDate < currentDate {
            return .expired
        }else if isSameDay {
           return .today
        }   else {
           return .nextDay
        }
    }
    static func getLocalTimeGreeting() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        switch hour {
        case 6..<12:
            return "Good morning"
        case 12..<18:
            return "Good afternoon"
        default:
            return "Good night"
        }
    }
    
    static func getSortedMonths(monthNames:[String])->[String]{
        let sortedMonthNames = monthNames.sorted { (month1, month2) -> Bool in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM"
            
            guard let date1 = dateFormatter.date(from: month1),
                  let date2 = dateFormatter.date(from: month2) else {
                return false // Return false if date conversion fails
            }
            return date1 < date2
        }
        return sortedMonthNames
    }
    
}
