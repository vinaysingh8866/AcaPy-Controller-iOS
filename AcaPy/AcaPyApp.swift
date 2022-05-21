//
//  AcaPyApp.swift
//  AcaPy
//
//  Created by Vinay Singh on 2022-05-21.
//

import SwiftUI

@main
struct AcaPyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
