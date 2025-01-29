//
//  SimpleEditorApp.swift
//  SimpleEditor
//
//  Created by MadCow on 2025/1/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct SimpleEditorApp: App {
    
    var body: some Scene {
        WindowGroup {
            CustomTabView(store: Store(initialState: TabFeature.State(), reducer: {
                TabFeature()
            }))
        }
    }
}
