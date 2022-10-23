//
//  MonthlyWidget.swift
//  MonthlyWidget
//
//  Created by Oliver Kirkegaard on 28/09/2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (DayEntry) -> ()) {
        let entry = DayEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [DayEntry] = []

        // Generate a timeline consisting of seven entries a day apart, starting from the current date.
        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: dayOffset, to: currentDate)!
            let startOfDate = Calendar.current.startOfDay(for: entryDate)
            let entry = DayEntry(date: startOfDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct DayEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}



struct MonthlyWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: DayEntry
    var config: MonthConfig
    
    init(entry: DayEntry) {
        self.entry = entry
        self.config = MonthConfig.determineConfig(from: entry.date)
    }
    

    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            ZStack{
                ContainerRelativeShape()
                    .fill(config.backgroundColor.gradient)
                
                VStack{
                    HStack(spacing: 4){
                        Spacer()
                        Image(systemName: "\(config.sfSymbols)")
                            .font(.title3)
                            .foregroundColor(config.dayAndWeekColor)
                        Text(entry.date.weekdayDisplayFormat)
                            .font(.title3)
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.6)
                            .foregroundColor(config.dayAndWeekColor)
                        Spacer()
                    }
                    Text(entry.date.dayDisplayFormat)
                        .font(.system(size: 80, weight: .heavy))
                        .foregroundColor(config.weekdayTextColor)
                    Text("U\(config.weekNumber(from: entry.date))")
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(config.dayAndWeekColor)
                }
                .padding()
            }
        case .accessoryInline:
            Text("U\(config.weekNumber(from: entry.date))")
        default:
            Text("Not implemented")
        }
        
    }
}

@main
struct MonthlyWidget: Widget {
    let kind: String = "MonthlyWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MonthlyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Monthly Style Widget")
        .description("The theme of the widget changes based on the month")
        .supportedFamilies([.systemSmall, .accessoryInline])
    }
}

struct MonthlyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyWidgetEntryView(entry: DayEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .previewDisplayName("systemSmall")
        
        MonthlyWidgetEntryView(entry: DayEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
            .previewDisplayName("Inline")

    }
    //Test funktion
    static func DateToDisplay(month: Int, day: Int) -> Date {
        let components = DateComponents(calendar: Calendar.current,
                                        year: 2022,
                                        month: month,
                                        day: day)
        return Calendar.current.date(from: components)!
    }
}

extension Date {
    var weekdayDisplayFormat: String {
        self.formatted(.dateTime.weekday(.wide))
    }
    
    var dayDisplayFormat: String {
        self.formatted(.dateTime.day())
    }
}
