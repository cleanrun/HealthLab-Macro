//
//  AppDelegate.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 03/04/22.
//

import UIKit
import SwiftUI
import CoreData

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        deleteAllFoodsFromDifferentDate()
        deleteAllNutritionsFromDifferentDate()
        return true
    }
    
    private func deleteAllFoodsFromDifferentDate() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FoodData")
        fetchRequest.predicate = NSPredicate(format: "dateAdded != %@", Date().getDateToString())
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let viewContext = PersistenceController.shared.container.viewContext
        
        do {
            try viewContext.execute(deleteRequest)
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    private func deleteAllNutritionsFromDifferentDate() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NutritionData")
        fetchRequest.predicate = NSPredicate(format: "dateAdded != %@", Date().getDateToString())
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let viewContext = PersistenceController.shared.container.viewContext
        
        do {
            try viewContext.execute(deleteRequest)
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
