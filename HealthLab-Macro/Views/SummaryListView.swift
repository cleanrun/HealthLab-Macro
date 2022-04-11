//
//  SummaryListView.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 03/04/22.
//

import SwiftUI
import CoreData

struct SummaryListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FoodData.id, ascending: true)], animation: .default) private var foods: FetchedResults<FoodData>
    
    @State private var isShowingIntakeSummarySheet: Bool = false
    
    var body: some View {
        NavigationView {
            getCurrentView()
                .listStyle(.grouped)
                .navigationTitle("Summary")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isShowingIntakeSummarySheet = true
                        }) {
                            Image(systemName: "info.circle")
                        }.sheet(isPresented: $isShowingIntakeSummarySheet) {
                            IntakeSummaryView(isShowingIntakeSummarySheet: $isShowingIntakeSummarySheet)
                                .interactiveDismissDisabled(true)
                        }
                    }
                }
        }
    }
    
    @ViewBuilder
    func getCurrentView() -> some View {
        if !foods.isEmpty {
            List {
                if !foods.filter { $0.mealType == .Breakfast }.isEmpty {
                    Section(header: Text(MealType.Breakfast.getStringRawValue())) {
                        ForEach(foods.filter { $0.mealType == .Breakfast }) { food in
                            UITableViewCellSubtitle(imageUrl: food.image!, title: food.title!, subtitle: food.mealType.getStringRawValue())
                        }
                    }
                }
                
                if !foods.filter { $0.mealType == .Brunch }.isEmpty {
                    Section(header: Text(MealType.Brunch.getStringRawValue())) {
                        ForEach(foods.filter { $0.mealType == .Brunch }) { food in
                            UITableViewCellSubtitle(imageUrl: food.image!, title: food.title!, subtitle: food.mealType.getStringRawValue())
                        }
                    }
                }
                
                if !foods.filter { $0.mealType == .Lunch }.isEmpty {
                    Section(header: Text(MealType.Lunch.getStringRawValue())) {
                        ForEach(foods.filter { $0.mealType == .Lunch }) { food in
                            UITableViewCellSubtitle(imageUrl: food.image!, title: food.title!, subtitle: food.mealType.getStringRawValue())
                        }
                    }
                }
                
                if !foods.filter { $0.mealType == .Dinner }.isEmpty {
                    Section(header: Text(MealType.Dinner.getStringRawValue())) {
                        ForEach(foods.filter { $0.mealType == .Dinner }) { food in
                            UITableViewCellSubtitle(imageUrl: food.image!, title: food.title!, subtitle: food.mealType.getStringRawValue())
                        }
                    }
                }
                
                if !foods.filter { $0.mealType == .Snack }.isEmpty {
                    Section(header: Text(MealType.Snack.getStringRawValue())) {
                        ForEach(foods.filter { $0.mealType == .Snack }) { food in
                            UITableViewCellSubtitle(imageUrl: food.image!, title: food.title!, subtitle: food.mealType.getStringRawValue())
                        }
                    }
                }
            }
        } else {
            VStack(spacing: 10) {
                Text("No daily intakes")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text("Go to the Food List page to start adding foods")
                    .font(.body)
                    .multilineTextAlignment(.center)
            }.padding(.horizontal, 80)
        }
    }
}

struct SummaryListView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryListView()
    }
}
