//
//  SplashView.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 24/05/2024.
//

import SwiftUI

struct SplashView: View {
    
    @State var showLoginView: Bool = true
    @State var password: String = ""
    @State var showHomeView: Bool
    
    var body: some View {
        NavigationView {
            CurveShape()
                .fill(showLoginView ? .white : Color("lightBackgroundColor"))
                .scaleEffect(CGSize(width: showLoginView ? 1.3 : 2.5, height: showLoginView ? 1 : 3.5))
                .background(Color("backgroundColor"))
                .shadow(color: Color("shadowColor"), radius: 30, x: 0, y: 0)
                .overlay() {
                    if showLoginView {
                        LoginViewContent("Enter your password", password: $password, showHomeView: $showHomeView).body
                    } else {
                        SplashViewContent().body
                    }
                    
                }
            
                .clipped()
                .ignoresSafeArea()
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                        withAnimation {
                            self.showLoginView = true
                        }
                    }
                }
        }
    }
}

#Preview {
    SplashView(showHomeView: false)
}

struct CurveShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.5, y: rect.height * 0.25))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct DogoTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(Font.custom("Lobster-Regular", size: 96))
            .foregroundColor(.white)
    }
}

struct SubTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(Font.custom("Mansalva-Regular", size: 28))
            .foregroundColor(.white)
    }
}

protocol ContentViewProtocol {
    associatedtype view: View
    var body: view { get }
}

struct SplashViewContent: View, ContentViewProtocol {
    var body: some View {
        VStack {
            DogoTextView(text: "Dogo")
            SubTextView(text: "Where Every Walk is")
            SubTextView(text: "Tail-Wagging Fun!")
        }
    }
}

struct LoginViewContent: View, ContentViewProtocol {
    
    @Binding private var showHomeView: Bool
    @State private var email: String = ""
    @Binding private var password: String
    @State private var isSecured: Bool
    private var passwordTitle: String = "Enter your password"
    
    init(_ passwordTitle: String, password: Binding<String>, showHomeView: Binding<Bool> ) {
        self.passwordTitle = passwordTitle
        self._password = password
        _isSecured = State(initialValue: true)
        self._showHomeView = showHomeView
    }
    
    var body: some View {
        let secureField = SecureField(passwordTitle, text: $password)
        let textField = TextField(passwordTitle, text: $password)
        VStack {
            Spacer()
                .padding(.top, 57)
            DogoTextView(text: "Dogo")
            SubTextView(text: "Paw Walkers")
            Circle()
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
                .frame(width: 221, height: 222)
                .foregroundColor(Color("dogoImageColor"))
                .overlay(
                    GeometryReader { geometry in
                        Image("DogoImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 221, height: 222)
                            .clipShape(Circle())
                    }
                )
                
            Text("Sign in")
                .font(Font.custom("Poppins-Regular", size: 18))
                .foregroundColor(Color("blackColor"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            HStack(alignment: .top) {
                Image(systemName: "envelope.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color("greyIconCOlor"))
                
                TextField("Enter your e-mail", text: $email)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color("textfieldColor"))
            .cornerRadius(8)
            .padding(.horizontal)
            .shadow(color: Color("textfieldColor"), radius: 5, x: 0, y: 0)
            .padding(.bottom, 12)
            
            HStack(alignment: .top) {
                Image(systemName: "lock.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color("greyIconCOlor"))
                if isSecured {
                    secureField
                } else {
                    textField
                }
                //              TextField("Enter your password", text: $email)
                Button(action: {
                    isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(Color("greyIconCOlor"))
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color("textfieldColor"))
            .cornerRadius(8)
            .padding(.horizontal)
            .shadow(color: Color("textfieldColor"), radius: 5, x: 0, y: 0)
            
            
            HStack {
                Text("Not registered yet?")
                    .font(Font.custom("Poppins-Regular", size: 14))
                    .foregroundColor(Color("blackColor"))
                
                Button(action: {
                    //action code
                }) {
                    Text("Sign up")
                        .font(Font.custom("Poppins-Bold", size: 14))
                        .foregroundColor(Color("blackColor"))
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal)
            .padding(.vertical, 5)
            
            Button(action: {
                showHomeView = true
            }) {
                Text("Enter")
                    .font(Font.custom("Poppins-Medium", size: 20))
                    .frame(width: 358, height: 50)
                    .background(Color("buttonColor"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Spacer()
                .padding(.vertical, 8)
            
            VStack {
                Text("Or continue with")
                    .font(Font.custom("Poppins-Regular", size: 16))
                    .foregroundColor(Color("blackColor"))
                HStack {
                    Button(action: {
                        // action
                    }) {
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 30.67)
                                .foregroundColor(Color("facebookColor"))
                            Text("Facebook")
                                .font(Font.custom("Montserrat-Medium", size: 14))
                        }
                        .padding(10)
                        .background(Color("textfieldColor"))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(height: 46.67)
                    
                    Button(action: {
                        // action
                    }) {
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 30.67)
                            Text("Google")
                                .font(Font.custom("Montserrat-Medium", size: 14))
                        }
                        .padding(10)
                        .background(Color("textfieldColor"))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(height: 46.67)
                    
                    Button(action: {
                        // action
                    }) {
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 30.67)
                            Text("Apple")
                                .font(Font.custom("Montserrat-Medium", size: 14))
                        }
                        .padding(10)
                        .background(Color("textfieldColor"))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(height: 46.67)
                    
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 67)
            
            Spacer()
        }
        NavigationLink("", destination:  MainTabbedView().navigationBarBackButtonHidden(true), isActive: $showHomeView)
            .navigationBarTitle("")
    }
}
