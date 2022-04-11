//
//  FoodData+CoreDataProperties.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 10/04/22.
//
//

import Foundation
import CoreData

extension FoodData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodData> {
        return NSFetchRequest<FoodData>(entityName: "FoodData")
    }

    @NSManaged public var id: Int32
    @NSManaged public var image: String?
    @NSManaged public var title: String?
    @NSManaged public var mealType: MealType
    @NSManaged public var dateAdded: String?

}

extension FoodData : Identifiable {

}
