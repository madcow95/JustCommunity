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
            HomeView(
                store: Store(initialState: HomeFeature.State()) {
                    HomeFeature()
                }
            )
        }
    }
}
