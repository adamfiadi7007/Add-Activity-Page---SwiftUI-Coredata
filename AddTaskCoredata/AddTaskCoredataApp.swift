//
//  AddTaskCoredataApp.swift
//  AddTaskCoredata
//
//  Created by Adam Ibnu fiadi on 05/08/22.
//

import SwiftUI

@main
struct AddTaskCoredataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
