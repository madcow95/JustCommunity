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
        // MARK: TODO - 사용자의 설정에 대한 View를 그리기
        Text("Setting View!")
    }
}
