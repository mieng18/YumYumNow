//
//  TabBarView.swift
//  YumYumNow
//
//  Created by mai nguyen on 7/9/23.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Tab = .first
    @State private var oldSelectedTab: Tab = .first
    @Namespace var animation

    @State var presentingCamera = false

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack(alignment:.bottom) {
                TabView(selection: $selectedTab) {
                    HomeTab()
                        .tag(Tab.first)
                        .setTabBarBackground(color: .whiteFFFEFE)


                    SearchTab()
                        .tag(Tab.second)
                        .setTabBarBackground(color: .whiteFFFEFE)

                    
                    CartTab()
                        .tag(Tab.third)
                        .setTabBarBackground(color: .whiteFFFEFE)



                    ProfileTab()
                        .tag(Tab.fourth)
                        .setTabBarBackground(color: .whiteFFFEFE)

                }
                .onChange(of: selectedTab) {    // SwiftUI 2.0 track changes
                    if selectedTab == .third {
                        self.presentingCamera = true
                        } else {
                            self.oldSelectedTab = $0
                        }
                    }
              
            CutomTabBarView(selectedTab: $selectedTab)
            }

        }

    }



struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

extension View{
    @ViewBuilder
    func setTabBarBackground(color: Color) -> some View {
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

enum Tab: String, CaseIterable {
    case first
    case second
    case third
    case fourth
    
    var icon: String {
        switch self {
            case .first: return "house"
            case .second: return "magnifyingglass.circle"
            case .third: return "cart"
            case .fourth: return "person"
        }
    }
    
    var iconFilled: String {
        switch self {
            case .first: return "house.fill"
            case .second: return "magnifyingglass.circle.fill"
            case .third: return "cart.fill"
            case .fourth: return "person.fill"
        }
    }


}


struct CutomTabBarView: View {
    @Binding var selectedTab: Tab
    @Namespace var animation

    var body: some View {
        TabBar()
    }

    @ViewBuilder
    func TabBar() -> some View {
        
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id:\.rawValue) {tab in
                VStack(spacing:4) {
                    Image(systemName: selectedTab == tab ? tab.iconFilled : tab.icon)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        


                }
                .foregroundColor(selectedTab == tab ? Color.purple462B9C : .gray)
                .padding(.top,8)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation(Animation.easeInOut) {
                        selectedTab = tab
                    }
                }
            }
        }
        .frame(height:54)
        .overlay(Divider(),alignment: .top)
        .background(Color.whiteFFFEFE)
    }
}


struct CutomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CutomTabBarView(selectedTab: .constant(.first))
    }
}
