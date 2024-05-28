//
//  ContentView.swift
//  DodoSwiftUITestApp
//
//  Created by Dev on 23/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var showLoginView = false
    
    var body: some View {
        
        VStack(spacing: -UIScreen.main.bounds.size.height + (showLoginView ? 700: 100)) {
            Color("backgroundColor")
            Color("lightBackgroundColor")
                .cornerRadius(200)
                .padding(.trailing, -60)
                .padding(.leading, -60)
                .padding(.bottom, -100)
                .shadow(color: Color("shadowColor"), radius: 20, x: 0, y: 0)
                .overlay() {
                    VStack {
                        DogoTextView(text: "Dogo")
                        SubTextView(text: "Where Every Walk is")
                        SubTextView(text: "Tail-Wagging Fun!")
                    }
                }
        }
        .clipped()
        .ignoresSafeArea()
//        .onAppear() {
//            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
//                withAnimation {
//                    self.showLoginView = true
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}

//struct DogoTextView: View {
//    var text: String
//    var body: some View {
//        Text(text)
//            .font(Font.custom("Lobster-Regular", size: 96))
//            .foregroundColor(.white)
//    }
//}
//struct SubTextView: View {
//    var text: String
//    var body: some View {
//        Text(text)
//            .font(Font.custom("Mansalva-Regular", size: 28))
//            .foregroundColor(.white)
//    }
//}
