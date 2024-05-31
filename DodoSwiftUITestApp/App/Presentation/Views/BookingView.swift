//
//  BookingView.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 28/05/2024.
//

import SwiftUI

struct BookingView: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [.white, .white, .white, .white, .white, Color("menuIconColor")]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.all)
                    bookingHeaderView(presentSideMenu: $presentSideMenu)
                        .padding(.horizontal, 24)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct textView: View {
    var text: String
    var font: String
    var fontSize: CGFloat
    var color: String
    var body: some View {
        Text(text)
            .font(Font.custom(font, size: fontSize))
            .foregroundColor(Color(color))
    }
}

struct bookingHeaderView: View {
    @State var gotoHome: Bool = false
    @Binding var presentSideMenu: Bool
    var body: some View {
        VStack(spacing: 18){
            NavigationHeader(viewName: MainTabbedView())
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        textView(text: "May", font: "Poppins-SemiBold", fontSize: 16, color: "blackColor")
                        Spacer()
                    }
                    BookingsInMonth(items: 2)
                }
                VStack {
                    HStack {
                        textView(text: "April", font: "Poppins-SemiBold", fontSize: 16, color: "blackColor")
                        Spacer()
                    }
                    BookingsInMonth(items: 3)
                }
                VStack {
                    HStack {
                        textView(text: "March", font: "Poppins-SemiBold", fontSize: 16, color: "blackColor")
                        Spacer()
                    }
                    BookingsInMonth(items: 3)
                }
                //            .padding(.top, -70)
                Spacer()
            }
            .overlay {
                BookingButton()
                    .offset(y: 270)
            }
        }
    }
}

struct BookingButton: View {
    var body: some View {
        BookingNavigation(text: "Booking", width: 350, font: "Poppins-Regular", fontSize: 24, height: 50)
        .offset(y: 45)
    }
}

struct BookingNavigation: View {
    @State var text: String
    @State var width: CGFloat
    @State var font: String
    @State var fontSize: CGFloat
    @State var height: CGFloat
    
    var body: some View {
        NavigationLink() {
            BookingScheduleView()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
        } label: {
            textView(text: text, font: font, fontSize: fontSize, color: "white")
                .frame(width: width, height: height)
                .background(Color("buttonColor"))
                .cornerRadius(8)
        }
    }
}

struct NavigationHeader<Content: View>: View {
    @State var viewName: Content
    var body: some View {
        HStack(spacing: 18){
            NavigationLink() {
                viewName
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                    .navigationViewStyle(.columns)
                
            } label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 10, height: 20)
                    .foregroundColor(Color("menuIconColor"))
            }
            textView(text: "Bookings", font: "Poppins-Regular", fontSize: 24, color: "blackColor")
            Spacer()
            Image(systemName: "bell.badge")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Color("menuIconColor"))
        }
    }
}

struct BookingsInMonth: View {
    var items: Int
    var body: some View {
        ScrollView (.vertical) {
            VStack {
                ForEach (0..<items) {_ in
                    Bookings()
                }
            }
        }
        .frame(height: .infinity)
    }
}

struct Bookings: View {
    var body: some View
    {
        HStack {
            Rectangle()
                .fill(.clear)
                .frame(width: .infinity, height: 102)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("textfieldColor1"), lineWidth: 0.5)
                    .shadow(radius: 5)
                )
                .overlay {
                    HStack {
                        VStack (spacing: 5) {
                            HStack (spacing: 8) {
                                Text("Emily T")
                                    .font(Font.custom("Poppins-Regular", size: 14))
                                    .foregroundColor(Color("blackColor"))
                                Spacer()
                            }
                            
                            HStack (spacing: 8) {
                                Image("map-pin")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 16, height: 16)
                                Text("In your home")
                                    .font(Font.custom("Poppins-Medium", size: 14))
                                    .foregroundColor(Color("blackColor"))
                                Spacer()
                            }
                            
                            HStack (spacing: 8) {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 10, height: 12)
                                    .foregroundColor(Color("yellowColor"))
                                Text("8:00 am - 9:00 am")
                                    .font(Font.custom("Poppins-Regular", size: 14))
                                    .foregroundColor(Color("blackColor"))
                                Spacer()
                            }
                        }
                        .padding(.leading, 16)
                        
                        Spacer()
                        
                        VStack {
                            Text("MAY")
                                .font(Font.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color("blackColor"))
                            Text("26")
                                .font(Font.custom("Poppins-SemiBold", size: 24))
                                .foregroundColor(Color("blackColor"))
                        }
                        .padding(.trailing, 16)
                    }
                }
        }
    }
}

#Preview {
    BookingView(presentSideMenu: .constant(true))
}
