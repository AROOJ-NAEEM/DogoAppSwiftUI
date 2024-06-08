////
////  DropDownPicker.swift
////  DogoSwiftUITestApp
////
////  Created by Dev on 31/05/2024.
////
//
//import SwiftUI
//
//struct DropDownPicker: View {
//    @Binding var selection: String?
//    @Binding var maxWidth: CGFloat
//    @Binding var iconName: String
//    @Binding var dropDownPlaceholder: String
//    
//    @State var showDropdown = false
////    @State var zindex = 1000.0
//    
////    @SceneStorage("drop_down_zindex") private var index = 1000.0
//    
////    var state: DropDownPickerState = .bottom
//    var options: [String]
//    
//    var body: some View {
////        GeometryReader {
////            let size = $0.size
////
////            VStack(spacing: 0) {
////                HStack {
////                    Image(systemName: iconName)
////                                            .resizable()
////                                            .frame(width: 32, height: 32)
////                                            .foregroundColor(Color("menuShadowColor"))
////                    textView(text: selection == nil ? dropDownPlaceholder : selection!, font: "Verdana-Regular", fontSize: 14, color: "textfieldColor1")
////                    
////                    Spacer(minLength: 0)
////
////                    Image(systemName: state == .top ? "chevron.up" : "chevron.down")
////                        .font(.title3)
////                        .foregroundColor(Color("textfieldColor1"))
////                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
////                }
////                .padding(.horizontal, 15)
////                .frame(width: maxWidth, height: 50)
////                .background(Color("dropDownColor"))
////                .contentShape(.rect)
////                .onTapGesture {
////                    toggleDropdown()
////                }
////                .zIndex(1)
////                
////                if state == .bottom && showDropdown {
////                    OptionsView()
////                        .zIndex(2)
////                }
////
////            }
////            .clipped()
////            .background(Color("dropDownColor"))
////            .cornerRadius(10)
////            .overlay {
////                RoundedRectangle(cornerRadius: 10)
////                    .stroke(Color("dropDownColor"))
////            }
////            .frame(height: size.height, alignment: state == .top ? .bottom : .top)
////          }
////          .frame(width: maxWidth, height: 50)
//////          .zIndex(zindex)
////    }
////    
//////    func OptionsView() -> some View {
//////        ScrollView {
//////            VStack(spacing: 0) {
//////                ForEach(options, id: \.self) { option in
//////                    HStack {
//////                        Text(option)
//////                        Spacer()
//////                        Image(systemName: "checkmark")
//////                            .opacity(selection == option ? 1 : 0)
//////                    }
//////                    .foregroundStyle(selection == option ? Color.primary : Color.gray)
//////                    .animation(.none, value: selection)
//////                    .frame(height: 40)
//////                    .contentShape(.rect)
//////                    .padding(.horizontal, 15)
//////                    .onTapGesture {
//////                        withAnimation(.snappy) {
//////                            selection = option
//////                            toggleDropdown()
//////                        }
//////                    }
//////                }
//////            }
//////            //        .zIndex(2)
//////            .frame(height: 160) 
//////        }
//////    }
////    func OptionsView() -> some View {
////        ScrollView {
////            VStack(spacing: 0) {
////                ForEach(options, id: \.self) { option in
////                    Text(option)
////                        .frame(maxWidth: .infinity, alignment: .leading)
////                        .padding(.horizontal, 15)
////                        .padding(.vertical, 5)
////                        .contentShape(Rectangle())
////                        .onTapGesture {
////                            withAnimation(.snappy) {
////                                selection = option
////                                toggleDropdown()
////                            }
////                        }
////                        .background(selection == option ? Color.blue : Color.clear)
////                }
////            }
////        }
////    }
////
////    
////    func toggleDropdown() {
////            index += 1
////            zindex = index
////            withAnimation(.snappy) {
////                showDropdown.toggle()
////            }
////        }
////    
////}
//        ZStack {
//                    VStack(spacing: 0) {
//                        HStack {
//                            Image(systemName: iconName)
//                                .resizable()
//                                .frame(width: 32, height: 32)
//                                .foregroundColor(Color("menuShadowColor"))
//                            Text(selection ?? dropDownPlaceholder)
//                                .font(Font.custom("Verdana-Regular", size: 14))
//                                .foregroundColor(Color("textfieldColor1"))
//                            
//                            Spacer()
//                            
//                            Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
//                                .font(.title3)
//                                .foregroundColor(Color("textfieldColor1"))
//                                .onTapGesture {
//                                    showDropdown.toggle()
//                                }
//                        }
//                        .padding(.horizontal, 15)
//                        .frame(width: maxWidth, height: 50)
//                        .background(Color("dropDownColor"))
//                        .contentShape(Rectangle())
//                    }
//                    
//                    if showDropdown {
//                        VStack {
//                            OptionsView(options: options, selection: $selection)
//                                .frame(maxWidth: maxWidth, maxHeight: 200)
//                                .background(Color.white)
//                                .cornerRadius(8)
//                                .padding()
//                                .shadow(radius: 5)
//                            Spacer()
//                        }
//                        .zIndex(1) // Ensure the options overlay on top of other content
//                    }
//                }
//            }
//        }
//struct OptionsView: View {
//    var options: [String]
//    @Binding var selection: String?
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            ForEach(options, id: \.self) { option in
//                Button(action: {
//                    selection = option
//                }) {
//                    Text(option)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.horizontal, 15)
//                        .padding(.vertical, 10)
//                }
//                .foregroundColor(.primary)
//            }
//        }
//    }
//}
//#Preview {
//    DropDownPicker(selection: .constant(nil), maxWidth: .constant(171), iconName: .constant("clock.circle"), dropDownPlaceholder: .constant("10:00 am"), options: ["10:00PM","11:00PM","12:00AM","1:00AM"])
//}
