//
//  MainTabbedView.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 28/05/2024.
//

import SwiftUI

struct MainTabbedView: View {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        ZStack{
            
            TabView(selection: $selectedSideMenuTab) {
                HomeView(presentSideMenu: $presentSideMenu)
                    .tag(0)
                
                
                BookingView(presentSideMenu: $presentSideMenu)
                    .tag(1)
//                ChatView(presentSideMenu: $presentSideMenu)
//                    .tag(2)
//                ProfileView(presentSideMenu: $presentSideMenu)
//                    .tag(3)
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuMainView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}

#Preview {
    MainTabbedView()
}
