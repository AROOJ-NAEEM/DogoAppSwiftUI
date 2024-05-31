//
//  BookingScheduleView.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 30/05/2024.
//

import SwiftUI

struct BookingScheduleView: View {
    
    @State var currentDate: Date = Date()
    @State var currentMonth = 0
    @State var selection: String? = nil
    @State var maxWidth: CGFloat = 171
    @State var maxWidthForName: CGFloat = .infinity
    @State var clockIconName: String = "clock.circle"
    @State var personIconName: String = "person.circle"
    @State var timePlaceholder: String = "10:00 am"
    @State var sitterPlaceholder: String = "Joana G"
    
    let dogSitters: [String] = ["Joana G", "Emily T", "Carly B"]
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            NavigationHeader(viewName: BookingView(presentSideMenu: .constant(true)))
            VStack(spacing: 16) {
                HStack {
                    DateView(text: "Select the date")
                    Spacer()
                }
                VStack(spacing: 16) {
                    CalendarView(currentMonth: $currentMonth, currentDate: $currentDate)
                    DividerView(padding: 0)
                    CustomDatePicker(currentDate: $currentDate, currentMonth: $currentMonth)
                }
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("menuShadowColor"), lineWidth: 1)
                        .shadow(radius: 5)
                }
            }
            VStack(spacing: 16) {
                HStack {
                    DateView(text: "Select the time")
                    Spacer()
                }
                HStack {
                    DropDownPicker(selection: $selection, maxWidth: $maxWidth, iconName: $clockIconName, dropDownPlaceholder: $timePlaceholder, options: getTimeArray())
                    Spacer()
                    DropDownPicker(selection: $selection, maxWidth: $maxWidth, iconName: $clockIconName, dropDownPlaceholder: $timePlaceholder, options: getTimeArray())
                }
            }
            VStack(spacing: 16) {
                HStack {
                    DateView(text: "Select the dog sitter")
                    Spacer()
                }
                HStack {
                    DropDownPicker(selection: $selection, maxWidth: $maxWidthForName, iconName: $personIconName, dropDownPlaceholder: $sitterPlaceholder, options: dogSitters)
                }
            }
            VStack {
                BookingNavigation(text: "Next", width: 350,  font: "Poppins-Regular", fontSize: 24, height: 50)
            }
            Spacer()
        }
        .padding(.horizontal, 24)
    }
    
    func getTimeArray() -> [String] {
        let lastTime: Double = 22
        var currentTime: Double = 5
        let incrementMinutes: Double = 60
        var timeArray: [String] = []
        while currentTime <= lastTime {
            currentTime += (incrementMinutes/60)
            let hours = Int(floor(currentTime))
            let minutes = Int(currentTime.truncatingRemainder(dividingBy: 1)*60)
            if minutes == 0 {
                timeArray.append("\(hours):00")
            } else {
                timeArray.append("\(hours):\(minutes)")
            }
        }
        return timeArray
    }
    
}

struct DateView: View {
    @State var text: String
    var body: some View {
        VStack() {
            textView(text: text, font: "Poppins-SemiBold", fontSize: 16, color: "blackColor")
        }
    }
}

struct CalendarView: View {
    @Binding var currentMonth: Int
    @Binding var currentDate: Date
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                    currentMonth -= 1
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("blackColor"))
                })
                Spacer()
                textView(text: extraDate()[0] , font: "Poppins-Medium", fontSize: 18, color: "blackColor")
                Spacer()
                Button(action: {
                    currentMonth += 1
                }, label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("blackColor"))
                })
            }
        }
    }
    //extracting year and months for display
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
}

#Preview {
    BookingScheduleView()
}
