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
    @State var startTimeSelection: String? = nil
    @State var endTimeSelection: String? = nil
    @State var sitterSelection: String? = nil
    @State var maxWidth: CGFloat = 171
    @State var maxWidthForName: CGFloat = .infinity
    @State var clockIconName: String = "clock.circle"
    @State var personIconName: String = "person.circle"
    @State var timePlaceholder: String = "10:00 am"
    @State var sitterPlaceholder: String = "Joana G"
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToThankYouView = false
    @State private var progress: Int = 0
    
    @ObservedObject var viewModel = BookingScheduleViewModel()
    
    @State private var dogSitters: [String] = [""]
    
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
            if progress >= 1 {
                VStack(spacing: 0) {
                    HStack {
                        DateView(text: "Select the time")
                        Spacer()
                    }
                    HStack(spacing: -20) {
                        DropDownView(selection: $startTimeSelection, iconName: $clockIconName, dropDownPlaceholder: $timePlaceholder, maxWidth: $maxWidth, options: getTimeArray())
                        
                            .padding(.leading, -12)
                        DropDownView(selection: $endTimeSelection, iconName: $clockIconName, dropDownPlaceholder: $timePlaceholder, maxWidth: $maxWidth, options: getTimeArray())
                        
                            .padding(.trailing, -12)
                    }
                }
                .padding(.bottom, -30)
            }
            if progress >= 2 {
                VStack(spacing: 0) {
                    HStack {
                        DateView(text: "Select the dog sitter")
                        Spacer()
                    }
                    HStack {
                        DropDownView(selection: $sitterSelection, iconName: $personIconName, dropDownPlaceholder: $sitterPlaceholder, maxWidth: $maxWidthForName, options: viewModel.dogSittersName)
                            .padding(.horizontal, -14)
                    }
                }
                .padding(.bottom, -30)
            }
            
            if progress < 2 {
                Spacer()
                    .frame(height: .infinity)
            }
            
            VStack {
                NavigationLink(destination: ThankyouView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true),
                               isActive: $navigateToThankYouView) {
                    EmptyView()
                }
                               .hidden()
                
                Button(action: {
                    if progress < 2 {
                        progress += 1
                    }
                    else {
                        viewModel.saveBooking(startTimeSelection: startTimeSelection, endTimeSelection: endTimeSelection, sitterSelection: sitterSelection, currentDate: currentDate) { Bool in
                            if Bool {
                                navigateToThankYouView = true
                            } else {
                                self.showAlert = true
                                self.alertMessage = "Booking Data is Incomplete."
                            }
                        }
                    }
                }) {
                    textView(text: "Next", font: "Poppins-Regular", fontSize: 24, color: "white")
                        .frame(width: 350, height: 50)
                        .background(Color("buttonColor"))
                        .cornerRadius(8)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Unable to Book"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
                Spacer()
            }
        .padding(.horizontal, 24)
        .background(Color("white"))
        .task {
            viewModel.fetchData()
        }
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
