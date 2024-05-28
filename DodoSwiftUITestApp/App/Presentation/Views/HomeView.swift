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
        VStack (spacing: 23){
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
                        Circle()
                            .fill(Color("lightPurpleColor"))
                            .frame(width: 358, height: 190)
                            .offset(x: -130)
                            .overlay {
                                GeometryReader { geometry in
                                    Image("dogoImage2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 180, height: 200)
                                }
                            }
                    }
//                Circle()
//                    .fill(Color("profileColor").opacity(0.3))
//                    .frame(width: 358, height: 150)
//                    .offset(x: -150)
//                Spacer()
//                VStack {
//                    
//                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    HomeView(presentSideMenu: .constant(true))
}
