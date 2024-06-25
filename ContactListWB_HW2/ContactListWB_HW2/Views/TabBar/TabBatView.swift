//
//  TabBarView.swift
//  WelcomeAppWB
//
//  Created by Илья Десятов on 12.06.2024.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        
        TabView {
            ForEach(TabItem.allCases, id: \.self) { item in
                itemView(for: item).tabItem {
                    Image(systemName: item.imageName)
                }
            }
        }
        .background(.red)
        .shadow(radius: 10)
    }
}

@ViewBuilder
private func itemView(for item: TabItem) -> some View {
    switch item {
    case .contacts: ContactsListView()
    case .chat: Text("chat")
    case .etc: Text("etc")
    }
}

#Preview {
    TabBarView()
}
