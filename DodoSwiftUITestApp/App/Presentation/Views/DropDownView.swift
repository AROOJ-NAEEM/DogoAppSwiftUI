//
//  DropDown.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 06/06/2024.
//

import SwiftUI

struct DropDownView: View {
    @Binding var selection: String?
    @State private var isExpanded = false
    @Binding var iconName: String
    @Binding var dropDownPlaceholder: String
    @Binding var maxWidth: CGFloat
    var options: [String]
        
        var body: some View {
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            self.isExpanded.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: iconName)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(Color("menuShadowColor"))
                            Spacer()
                            Text(selection ?? dropDownPlaceholder)
                                .font(Font.custom("Verdana-Regular", size: 14))
                                .foregroundColor(Color("textfieldColor1"))
                            Spacer()
                            Image(systemName: "chevron.down")
                                .font(.title3)
                                .foregroundColor(Color("textfieldColor1"))
                                .rotationEffect(.degrees(isExpanded ? 180 : 0))
                                .animation(.easeInOut(duration: 0.2))
                        }
                        .frame(maxWidth: maxWidth, maxHeight: 50)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    }
                }
                
                if isExpanded {
                    ScrollView {
                        VStack {
                            ForEach(options, id: \.self) { option in
                                Button(action: {
                                    self.selection = option
                                    withAnimation {
                                        self.isExpanded.toggle()
                                    }
                                }) {
                                    Text(option)
                                        .padding(10)
                                        .frame(maxWidth: maxWidth, alignment: .leading)
                                        .foregroundColor(Color("textfieldColor1"))
                                }
                                .background(Color.gray.opacity(0.2))
                            }
                        }
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.vertical, 4)
                    }
                    .frame(height: 100)
                }
                
                Spacer()
            }
            .padding()
        }
}

#Preview {
    DropDownView(selection: .constant(nil), iconName: .constant("clock.circle"), dropDownPlaceholder: .constant("10:00"), maxWidth: .constant(170), options: ["option1", "option2"])
}
