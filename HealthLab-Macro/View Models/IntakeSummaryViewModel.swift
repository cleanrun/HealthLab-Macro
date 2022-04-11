//
//  IntakeSummaryViewModel.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 11/04/22.
//

import Foundation
import CoreData

class IntakeSummaryViewModel {
    var mealCount: Int = 0
    var calories: Int = 0
    var carbs: Int = 0
    var fat: Int = 0
    var protein: Int = 0
    
    init() {
        getMealCount()
        getTotalNutritionData()
    }
    
    private func getMealCount() {
        let fetchRequest: NSFetchRequest<FoodData>
        fetchRequest = FoodData.fetchRequest()
        
        let context = PersistenceController.shared.container.viewContext
        do {
            let meals = try context.fetch(fetchRequest)
            mealCount = meals.count
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func getTotalNutritionData() {
        let fetchRequest: NSFetchRequest<NutritionData>
        fetchRequest = NutritionData.fetchRequest()
        
        let context = PersistenceController.shared.container.viewContext
        do {
            let nutritions = try context.fetch(fetchRequest)
            if !nutritions.isEmpty {
                for nutrition in nutritions {
                    calories += Int(nutrition.calories)
                    carbs += Int(nutrition.carbs)
                    fat += Int(nutrition.fat)
                    protein += Int(nutrition.protein)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
