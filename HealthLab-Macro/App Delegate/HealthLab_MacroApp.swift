//
//  HealthLab_MacroApp.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 02/04/22.
//

import SwiftUI

@main
struct HealthLab_MacroApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
