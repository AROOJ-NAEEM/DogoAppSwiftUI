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
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("menuIconColor"))
                }
                Spacer()
            }
            
            Spacer()
            Text("Booking View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    BookingView(presentSideMenu: .constant(true))
}
