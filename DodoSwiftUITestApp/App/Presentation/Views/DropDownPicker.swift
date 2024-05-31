//
//  DropDownPicker.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 31/05/2024.
//

import SwiftUI

struct DropDownPicker: View {
    @Binding var selection: String?
    @Binding var maxWidth: CGFloat
    @Binding var iconName: String
    @Binding var dropDownPlaceholder: String
    
    @State var showDropdown = false
    @State var zindex = 1000.0
    
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    
    var state: DropDownPickerState = .bottom
    var options: [String]
    
    var body: some View {
        GeometryReader {
            let size = $0.size

            VStack(spacing: 0) {
                HStack {
                    Image(systemName: iconName)
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(Color("menuShadowColor"))
                    textView(text: selection == nil ? dropDownPlaceholder : selection!, font: "Verdana-Regular", fontSize: 14, color: "textfieldColor1")
                    
                    Spacer(minLength: 0)

                    Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                        .font(.title3)
                        .foregroundColor(Color("textfieldColor1"))
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                }
                .padding(.horizontal, 15)
                .frame(width: maxWidth, height: 50)
                .background(Color("dropDownColor"))
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zindex = index
                    withAnimation(.snappy) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10)
                
                if state == .bottom && showDropdown {
//                    ScrollView(.vertical) {
                        OptionsView()
//                    }
                }

            }
            .clipped()
            .background(Color("dropDownColor"))
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("dropDownColor"))
            }
            .frame(height: size.height, alignment: state == .top ? .bottom : .top)
          }
          .frame(width: maxWidth, height: 50)
          .zIndex(zindex)
    }
    
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                HStack {
                    Text(option)
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(selection == option ? 1 : 0)
                }
                .foregroundStyle(selection == option ? Color.primary : Color.gray)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .padding(.horizontal, 15)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        showDropdown.toggle()
                    }
                }
            }
        }
        .transition(.move(edge: state == .top ? .bottom : .top))
        .zIndex(1)
    }
    
}

#Preview {
    DropDownPicker(selection: .constant(nil), maxWidth: .constant(171), iconName: .constant("clock.circle"), dropDownPlaceholder: .constant("10:00 am"), options: ["10:00PM","11:00PM","12:00AM","1:00AM"])
}
