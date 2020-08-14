import UIKit
enum DateFormat  {
    
    case dd_MMMM_yyyy
    case dd_MM_yyyy
    case dd_MM_yyyy2
    case yyyy_MM_dd
    case hh_mm_a
    case yyyy_MM_dd_hh_mm_a
    case yyyy_MM_dd_hh_mm_a2
    case dateWithTimeZone
    case dd_MMM_yyyy
    case mm_dd_yyyy_hh_mm
    func get() -> String{
        
        switch self {
            
        case .dd_MMMM_yyyy : return "dd MMMM, yyyy"
        case .dd_MM_yyyy : return "dd-MM-yyyy"
        case .dd_MM_yyyy2 : return "dd/MM/yyyy"
        case .yyyy_MM_dd : return "yyyy-MM-dd"
        case .hh_mm_a : return "hh:mm a"
        case .yyyy_MM_dd_hh_mm_a : return  "yyyy-MM-dd hh:mm a"
        case .yyyy_MM_dd_hh_mm_a2 : return  "dd MMM yyyy, hh:mm a"
        case  .dateWithTimeZone : return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        case  .mm_dd_yyyy_hh_mm : return "yyyy-MM-dd HH:mm:ss"
        case .dd_MMM_yyyy : return "dd MMM yyyy"
            
        }
    }
}
extension Date{
    var millisecondsSince1970: Double {
        
        return ((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    func calculateDiffInDays(date:Date) -> Int {
        let calendar = Calendar.current

        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)

        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components.day ?? 0
    }
    //date to string
    func dateToString(format:String)->String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format  //Your New Date format as per requirement change it own
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let newDate = dateFormatter.string(from: self)
        return newDate
    }
    
    //Calculate Age
    
    var age: Int {
        //   return Calendar.current.component(.Year, from: self )
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
        // return NSCalendar.currentCalendar.components(.Year, fromDate: self, toDate: NSDate(), options: []).year
    }
    
  static func - (lhs: Date, rhs: Date) -> TimeInterval {
          return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
      }
    
}


extension String {
    func dateFromString(format:String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)!
    }
}
