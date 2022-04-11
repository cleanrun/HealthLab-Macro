//
//  FoodListView.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 03/04/22.
//

import SwiftUI

struct FoodListView: View {
    
    @StateObject private var viewModel = FoodListViewModel()
    
    var body: some View {
        NavigationView {
            getCurrentView()
                .listStyle(.plain)
                .navigationTitle("Food List")
                .searchable(text: $viewModel.searchQuery, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
    
    @ViewBuilder
    private func getCurrentView() -> some View {
        if !viewModel.result.results.isEmpty {
            List(viewModel.result.results, id: \.id) { food in
                NavigationLink(destination: FoodDetailView(food: food)) {
                    UITableViewCellSubtitle(imageUrl: food.image, title: food.title)
                }
            }
        } else {
            Text("No results")
                .font(.title)
                .multilineTextAlignment(.center)
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}
