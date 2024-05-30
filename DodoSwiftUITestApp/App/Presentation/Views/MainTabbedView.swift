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
            if selectedSideMenuTab == 0 {
                HomeView(presentSideMenu: $presentSideMenu)
                                    .tag(0)
            }
            else if selectedSideMenuTab == 1 {
                BookingView(presentSideMenu: $presentSideMenu)
                                                .tag(1)
            }
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuMainView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}

#Preview {
    MainTabbedView()
}
