//
//  SettingView.swift
//  SimpleEditor
//
//  Created by MadCow on 2025/1/31.
//

import SwiftUI
import ComposableArchitecture

struct SettingView: View {
    @Bindable var store: StoreOf<SettingFeature>
    
    var body: some View {
        Text("Setting View!")
    }
}
