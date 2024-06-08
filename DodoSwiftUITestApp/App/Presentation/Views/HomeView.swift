//
//  HomeView.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 27/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @Binding var presentSideMenu: Bool
    @State private var search: String = ""
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
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
                    
                    HStack(spacing: 2) {
                        let displayName = AuthManager.auth.currentUser?.displayName ?? ""
                        textView(text: "Hello", font: "Poppins-Regular", fontSize: 24, color: "blackColor")
                        textView(text: ", \(displayName.components(separatedBy: " ").first ?? "")", font: "Poppins-Bold", fontSize: 24, color: "blackColor")
                    }
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
                        .overlay {
                            if search.isEmpty {
                                HStack {
                                    Text("Search by location, name ...").foregroundColor(Color("greyIconCOlor"))
                                    Spacer()
                                }
                            }
                        }
                        .foregroundColor(Color("blackColor"))
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color("textfieldColor"))
                .cornerRadius(8)
                .shadow(color: Color("textfieldColor"), radius: 5, x: 0, y: 0)
                
                HStack {
                    Rectangle()
                        .fill(Color("dogoImageColor"))
                        .frame(width: .infinity, height: 130)
                        .cornerRadius(8)
                        .overlay {
                            HStack(spacing: -6) {
                                VStack {
                                    Image("homeImage")
                                        .resizable()
                                        .frame(width: 157, height: 150)
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
                                    BookingNavigation(viewName: BookingView(presentSideMenu: .constant(true)), text: "Enjoy", width: 74, font: "Poppins-Medium", fontSize: 16, height: 34)
                                }
                            }
                            .padding(.trailing)
                        }
                }
                
                VStack (spacing: 16) {
                    HStack {
                        textView(text: "Your next tour", font: "Poppins-SemiBold", fontSize: 16, color: "blackColor")
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
                                            textView(text: "Emily T", font: "Poppins-Regular", fontSize: 16, color: "blackColor")
                                            Spacer()
                                        }
                                        
                                        HStack (spacing: 8) {
                                            Image("map-pin")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 16, height: 16)
                                            textView(text: "In your home", font: "Poppins-Medium", fontSize: 14, color: "blackColor")
                                            Spacer()
                                        }
                                        
                                        HStack (spacing: 8) {
                                            Image(systemName: "calendar")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 16, height: 16)
                                                .foregroundColor(Color("yellowColor"))
                                            textView(text: "8:00 am - 9:00 am", font: "Poppins-Regular", fontSize: 14, color: "blackColor")
                                            Spacer()
                                        }
                                    }
                                    .padding(.leading, 16)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        textView(text: "May", font: "Poppins-Medium", fontSize: 16, color: "blackColor")
                                        textView(text: "26", font: "Poppins-SemiBold", fontSize: 24, color: "blackColor")
                                    }
                                    .padding(.trailing, 16)
                                }
                            }
                    }
                }
                
                VStack (spacing: 10) {
                    HStack {
                        textView(text: "Popular", font: "Poppins-SemiBold", fontSize: 16, color: "blackColor")
                        Spacer()
                        Button {
                            
                        } label: {
                            textView(text: "See all", font: "Poppins-SemiBold", fontSize: 14, color: "buttonColor")
                        }
                        
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(viewModel.dogSitters, id: \.id) {dogSitter in
                                VStack (alignment: .leading) {
                                    ZStack {
                                        WebImage(url: URL(string: dogSitter.profile))
                                            .resizable()
                                            .indicator(.activity)
                                            .frame(width: 120, height: 120)
                                            .cornerRadius(8)
                                        ZStack {
                                            textView(text: "  $\(dogSitter.charges)/hour  ", font: "Poppins-Medium", fontSize: 12, color: "white")
                                                .background(Color("buttonColor"))
                                                .cornerRadius(50)
                                                .offset(x: 30, y: -60)
                                        }
                                    }
                                    textView(text: dogSitter.name, font: "Poppins-Medium", fontSize: 16, color: "blackColor")
                                    HStack (spacing: 0) {
                                        ForEach(0..<dogSitter.rating) {_ in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(Color("ratingColor"))
                                                .overlay {
                                                    Image(systemName: "star")
                                                        .foregroundColor(Color("menuShadowColor"))
                                                }
                                        }
                                        ForEach(0..<(5 - dogSitter.rating)) {_ in
                                            Image(systemName: "star")
                                                .foregroundColor(Color("ratingColor"))
                                                .overlay {
                                                    Image(systemName: "star")
                                                        .foregroundColor(Color("menuShadowColor"))
                                                }
                                        }

                                    }
                                    textView(text: "\(dogSitter.tours) tours", font: "Poppins-Regular", fontSize: 14, color: "blackColor")
                                }
                            }
                        }
                        .padding(.top, 10)
                    }
                    .task { viewModel.fetchData() }
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            Spacer()
        }
    }
}

#Preview {
    HomeView(presentSideMenu: .constant(true))
}
