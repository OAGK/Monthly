//
//  MonthConfig.swift
//  Monthly
//
//  Created by Oliver Kirkegaard on 28/09/2022.
//

import SwiftUI

struct MonthConfig{
    let backgroundColor: Color
    let sfSymbols: String
    let weekdayTextColor: Color
    let dayAndWeekColor: Color
    
    func weekNumber(from date: Date) -> Int {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        calendar.minimumDaysInFirstWeek = 4
        return calendar.component(.weekOfYear, from: date)
    }
    
    static func determineConfig(from date: Date) -> MonthConfig {
           let monthInt = Calendar.current.component(.month, from: date)

           switch monthInt {
           case 1:
               return MonthConfig(backgroundColor: .gray,
                                  sfSymbols: "snowflake.circle",
                                  weekdayTextColor: .black.opacity(0.6),
                                  dayAndWeekColor: .white.opacity(0.8))
           case 2:
               return MonthConfig(backgroundColor: .palePink,
                                  sfSymbols: "cloud.snow.circle",
                                  weekdayTextColor: .black.opacity(0.5),
                                  dayAndWeekColor: .pink.opacity(0.8))
           case 3:
               return MonthConfig(backgroundColor: .paleGreen,
                                  sfSymbols: "wind.snow.circle",
                                  weekdayTextColor: .black.opacity(0.7),
                                  dayAndWeekColor: .darkGreen.opacity(0.8))
           case 4:
               return MonthConfig(backgroundColor: .paleBlue,
                                  sfSymbols: "cloud.rain.circle",
                                  weekdayTextColor: .black.opacity(0.5),
                                  dayAndWeekColor: .purple.opacity(0.8))
           case 5:
               return MonthConfig(backgroundColor: .paleYellow,
                                  sfSymbols: "camera.macro.circle",
                                  weekdayTextColor: .black.opacity(0.5),
                                  dayAndWeekColor: .pink.opacity(0.7))
           case 6:
               return MonthConfig(backgroundColor: .skyBlue,
                                  sfSymbols: "cloud.sun.circle",
                                  weekdayTextColor: .black.opacity(0.5),
                                  dayAndWeekColor: .paleYellow.opacity(0.8))
           case 7:
               return MonthConfig(backgroundColor: .blue,
                                  sfSymbols: "thermometer.sun.circle",
                                  weekdayTextColor: .black.opacity(0.5),
                                  dayAndWeekColor: .paleBlue.opacity(0.8))
           case 8:
               return MonthConfig(backgroundColor: .paleOrange,
                                  sfSymbols: "sun.max.circle",
                                  weekdayTextColor: .black.opacity(0.5),
                                  dayAndWeekColor: .darkOrange.opacity(0.8))
           case 9:
               return MonthConfig(backgroundColor: .paleRed,
                                  sfSymbols: "leaf.circle",
                                  weekdayTextColor: .black.opacity(0.5),
                                  dayAndWeekColor: .paleYellow.opacity(0.9))
           case 10:
               return MonthConfig(backgroundColor: .monthlyGreen,
                                  sfSymbols: "cloud.rain.circle",
                                  weekdayTextColor: .white.opacity(0.6),
                                  dayAndWeekColor: .orange.opacity(0.8))
           case 11:
               return MonthConfig(backgroundColor: .paleBrown,
                                  sfSymbols: "cloud.sleet.fill",
                                  weekdayTextColor: .black.opacity(0.6),
                                  dayAndWeekColor: .black.opacity(0.6))
           case 12:
               return MonthConfig(backgroundColor: .paleRed,
                                  sfSymbols: "cloud.snow.circle",
                                  weekdayTextColor: .white.opacity(0.9),
                                  dayAndWeekColor: .darkGreen.opacity(0.7))
           default:
               return MonthConfig(backgroundColor: .gray,
                                  sfSymbols: "calendar.circle",
                                  weekdayTextColor: .black.opacity(0.6),
                                  dayAndWeekColor: .white.opacity(0.8))
           }
       }
}
