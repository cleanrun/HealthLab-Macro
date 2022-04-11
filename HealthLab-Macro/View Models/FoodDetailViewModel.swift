//
//  FoodDetailViewModel.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 05/04/22.
//

import Foundation
import CoreData

class FoodDetailViewModel: ObservableObject {
    let food: Food
    
    @Published var nutrition: Nutrition!
    @Published var isLoading: Bool = true
    @Published var error: Error?
    
    init(food: Food) {
        self.food = food
        Task {
            await getNutrition()
        }
    }
    
    func getNutrition() async {
        isLoading = true
        await Webservice.request(endpoint: .NutritionDetail(id: food.id), type: Nutrition.self, onSuccess: { [unowned self] response in
            DispatchQueue.main.async {
                self.isLoading = false
                self.nutrition = response
                self.error = nil
            }
        }, onFailed: { error in
            DispatchQueue.main.async {
                self.isLoading = false
                self.error = error
            }
        })
    }
    
    func addFoodToSummary(viewContext: NSManagedObjectContext, mealType: MealType) {
        let currentDate = Date().getDateToString()
        let newFood = FoodData(context: viewContext)
        newFood.id = Int32(food.id)
        newFood.title = food.title
        newFood.image = food.image
        newFood.mealType = mealType
        newFood.dateAdded = currentDate
        
        if let nutrition = nutrition {
            let newNutrition = NutritionData(context: viewContext)
            newNutrition.calories = Int32(nutrition.calories.removeAlphabets()) ?? 0
            newNutrition.carbs = Int32(nutrition.carbs.removeAlphabets()) ?? 0
            newNutrition.fat = Int32(nutrition.fat.removeAlphabets()) ?? 0
            newNutrition.protein = Int32(nutrition.protein.removeAlphabets()) ?? 0
            newNutrition.dateAdded = currentDate
        }
        
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
}
