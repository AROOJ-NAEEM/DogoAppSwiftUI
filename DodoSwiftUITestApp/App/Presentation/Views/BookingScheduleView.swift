//
//  BookingScheduleView.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 30/05/2024.
//

import SwiftUI

struct BookingScheduleView: View {
    var body: some View {
        VStack(spacing: 32) {
            NavigationHeader(viewName: BookingView(presentSideMenu: .constant(true)))
            VStack(spacing: 16) {
                HStack {
                    DateView()
                    Spacer()
                }
                VStack {
                    CalendarView()
                    DividerView(padding: 0)
                }
                .padding(.horizontal, 8)
            }
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

struct DateView: View {
    var body: some View {
        VStack() {
            textView(text: "Select the date", font: "Poppins-SemiBold", fontSize: 16, color: "blackColor")
        }
    }
}

struct CalendarView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("blackColor"))
                })
                Spacer()
                textView(text: "May", font: "Poppins-Medium", fontSize: 18, color: "blackColor")
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("blackColor"))
                })
            }
        }
    }
}

#Preview {
    BookingScheduleView()
}
