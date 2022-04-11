//
//  ContentView.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 02/04/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FoodListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
            SummaryListView()
                .tabItem {
                    Label("Summary", systemImage: "note.text")
                }
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
