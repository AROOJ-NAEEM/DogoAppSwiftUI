//
//  HomeView.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 27/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var presentSideMenu: Bool
    @State private var search: String = ""
    
    var body: some View {
//        VStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.lightPurple, .white, .white, .white, .white, .white, Color("dogoImageColor").opacity(0.5)]),
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack (spacing: 23){
                    Spacer()
                    HStack (spacing: 16){
                        Button{
                            presentSideMenu.toggle()
                        } label: {
                            Image(systemName: "line.horizontal.3")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("menuIconColor"))
                        }
                        
                        Text("Hello,")
                            .font(Font.custom("Poppins-Regular", size: 24))
                            .foregroundColor(Color("blackColor"))
                        + Text(" Coleen!")
                            .font(Font.custom("Poppins-Bold", size: 24))
                            .foregroundColor(Color("blackColor"))
                        Spacer()
                        
                        Image(systemName: "bell.badge")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("menuIconColor"))
                    }
                    
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color("greyIconCOlor"))
                        
                        TextField("Search by location, name ...", text: $search)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color("textfieldColor"))
                    .cornerRadius(8)
                    .shadow(color: Color("textfieldColor"), radius: 5, x: 0, y: 0)
                    
                    HStack {
                        Rectangle()
                            .fill(Color("dogoImageColor"))
                            .frame(width: .infinity, height: 153)
                            .cornerRadius(8)
                            .overlay {
                                HStack {
                                    VStack {
                                        Image("homeImage")
                                            .resizable()
                                            .frame(width: 147, height: 170)
                                            .cornerRadius(8)
                                    }
                                    .offset(y: -8)
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                        VStack(alignment: .trailing)  {
                                            HStack {
                                                textView(text: "Otto is giving you", font: "Poppins-Regular", fontSize: 14, color: "blackColor")
                                                textView(text: "20%", font: "Poppins-Black", fontSize: 28, color: "blackColor")
                                            }
                                            textView(text: "on your first booking", font: "Poppins-Regular", fontSize: 14, color: "blackColor")
                                        }
                                        BookingNavigation(text: "Enjoy", width: 74, font: "Poppins-Medium", fontSize: 16, height: 34)
                                    }
                                }
                                .padding(.trailing)
                            }
                    }
                    
                    VStack (spacing: 16) {
                        HStack {
                            Text("Your next tour")
                                .font(Font.custom("Poppins-SemiBold", size: 16))
                            Spacer()
                        }
                        
                        HStack {
                            Rectangle()
                                .fill(.clear)
                                .frame(width: .infinity, height: 116)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color("menuShadowColor"), lineWidth: 1)
                                )
                                .shadow(radius: 5)
                                .overlay {
                                    HStack {
                                        VStack {
                                            HStack (spacing: 8) {
                                                Image("profile2")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 32, height: 32)
                                                Text("Emily T")
                                                    .font(Font.custom("Poppins-Regular", size: 16))
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
                                                    .frame(width: 16, height: 16)
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
                                            Text("May")
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
                    
                    VStack (spacing: 10) {
                        HStack {
                            Text("Popular")
                                .font(Font.custom("Poppins-SemiBold", size: 16))
                                .foregroundColor(Color("blackColor"))
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("See all")
                                    .font(Font.custom("Poppins-SemiBold", size: 14))
                                    .foregroundColor(Color("buttonColor"))
                            }
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<10) {_ in
                                    VStack (alignment: .leading) {
                                        ZStack {
                                            Image("scrollViewImage")
                                                .resizable()
                                                .frame(width: 120, height: 120)
                                            ZStack {
                                                Text("  $15/hour  ")
                                                    .font(Font.custom("Poppins-Medium", size: 12))
                                                    .foregroundColor(.white)
                                                    .background(Color("buttonColor"))
                                                    .cornerRadius(50)
                                                    .offset(x: 30, y: -60)
                                            }
                                        }
                                        //                                                                    .padding(.top)
                                        
                                        Text("Emily T")
                                            .font(Font.custom("Poppins-Medium", size: 16))
                                            .foregroundColor(Color("blackColor"))
                                        HStack (spacing: 0) {
                                            ForEach(0..<5) {_ in
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(Color("ratingColor"))
                                                    .overlay {
                                                        Image(systemName: "star")
                                                            .foregroundColor(Color("menuShadowColor"))
                                                    }
                                            }
                                        }
                                        Text("128 tours")
                                            .font(Font.custom("Poppins-Regular", size: 14))
                                            .foregroundColor(Color("blackColor"))
                                    }
                                }
                            }
                                                                        .padding(.top, 10)
                        }
                    }
                    Spacer()
                    //                    .padding(.bottom, 60)
                }
                .padding(.horizontal, 16)
                Spacer()
                //        .padding(.bottom, 69)
            }
            Spacer()
//        }
        
    }
}

#Preview {
    HomeView(presentSideMenu: .constant(true))
}
