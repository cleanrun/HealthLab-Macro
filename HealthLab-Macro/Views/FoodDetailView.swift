//
//  FoodDetailView.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 03/04/22.
//

import SwiftUI

struct FoodDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject private var viewModel: FoodDetailViewModel
    
    @State private var isShowingMealTypeActionSheet: Bool = false
    
    init(food: Food) {
        _viewModel = StateObject(wrappedValue: FoodDetailViewModel(food: food))
    }
    
    var body: some View {
        List {
            AsyncImage(url: URL(string: viewModel.food.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(8)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200, alignment: .center)
            }.listRowBackground(Color.clear)
                .listRowSeparator(.hidden)

            if viewModel.nutrition != nil {
                Section(header: Text("Nutrition Facts")) {
                    UITableViewCellDefault(title: "Calories", subtitle: "\(viewModel.nutrition.calories.removeAlphabets()) kCal")
                    UITableViewCellDefault(title: "Carbs", subtitle: "\(viewModel.nutrition.carbs.removeAlphabets()) gr")
                    UITableViewCellDefault(title: "Fat", subtitle: "\(viewModel.nutrition.fat.removeAlphabets()) gr")
                    UITableViewCellDefault(title: "Protein", subtitle: "\(viewModel.nutrition.protein.removeAlphabets()) gr")
                }
            }
        }
        .navigationTitle(viewModel.food.title)
        .listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingMealTypeActionSheet = true
                    }) {
                        Image(systemName: "plus")
                    }.confirmationDialog("Which type of meal?", isPresented: $isShowingMealTypeActionSheet, titleVisibility: .visible) {
                        Button("Breakfast") {
                            viewModel.addFoodToSummary(viewContext: viewContext, mealType: .Breakfast)
                        }
                        
                        Button("Brunch") {
                            viewModel.addFoodToSummary(viewContext: viewContext, mealType: .Brunch)
                        }
                        
                        Button("Lunch") {
                            viewModel.addFoodToSummary(viewContext: viewContext, mealType: .Lunch)
                        }
                        
                        Button("Dinner") {
                            viewModel.addFoodToSummary(viewContext: viewContext, mealType: .Dinner)
                        }
                        
                        Button("Snack") {
                            viewModel.addFoodToSummary(viewContext: viewContext, mealType: .Snack)
                        }
                    }
                }
            }
    }
}

//struct FoodDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodDetailView(food: Food(id: 658277, title: "Rice Pilaf", image: "https://spoonacular.com/recipeImages/658277-312x231.jpg"))
//    }
//}

