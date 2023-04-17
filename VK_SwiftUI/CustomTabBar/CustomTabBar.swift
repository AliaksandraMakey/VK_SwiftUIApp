//
//  CustomTabBar.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//


import SwiftUI


struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }

    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                    .font(.system(size: 25))
                    .scaleEffect( tab == selectedTab ? 1.70 : 1.0 )
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                Spacer()
            }
            
        } .frame(width: 400, height: 65)
            .background(.thinMaterial)
            .padding(.bottom, -35)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.newspaper))
    }
}
