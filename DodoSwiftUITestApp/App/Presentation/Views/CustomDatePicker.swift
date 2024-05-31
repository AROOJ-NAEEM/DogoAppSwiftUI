//
//  CustomDatePicker.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 31/05/2024.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Binding var currentDate: Date
    @Binding var currentMonth: Int
    
    var body: some View {
        
        //days
        let days : [String] = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        HStack(spacing: 24) {
            ForEach(days, id: \.self) { day in
                textView(text: day, font: "Poppins-Medium", fontSize: 12, color: "blackColor")
            }
        }
        
        VStack(spacing: 16) {
            //dates
            //LazyGrid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 15, content: {
                ForEach(extractDate()) { value in
                    cardView(value: value)
                        .background(
                            Circle()
                                .fill(value.day != -1 ? Color("yellowColor") : .white)
                                .frame(width: 42, height: 42)
                                .opacity(isSameDate(date1: value.date, date2: currentDate) ? 1: 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            })
        }
        .onChange(of: currentMonth) { newValue in
            currentDate = getCurrentMonth()
        }
        
    }
    
    @ViewBuilder
    func cardView(value: DateValue)-> some View {
        VStack {
            if value.day != -1 {
                textView(text: "\(value.day)", font: "Poppins-Regular", fontSize: 20, color: "blackColor")
            }
        }
        .padding(.vertical, 8)
        .frame(height: 40, alignment: .top)
    }
    
    func isSameDate(date1: Date, date2: Date)-> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    //extracting year and months for display
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else { return Date() }
        
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        //getting current month date
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth
        
        var days = currentMonth().getAllDate().compactMap { date -> DateValue in
            //getting date
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        //adding offset daysto get exact week days
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 2 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
}

#Preview {
    CustomDatePicker(currentDate: .constant(Date()), currentMonth: .constant(0))
}

//Extending date to get current month date
extension Date {
    func getAllDate() -> [Date] {
        let calendar = Calendar.current
        //getting start date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))
        let range = calendar.range(of: .day, in: .month, for: startDate ?? self)
        return range?.compactMap{ day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate ?? self) ?? Date.now
        } ?? []
    }
}
