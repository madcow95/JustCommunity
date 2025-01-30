//
//  SettingFeature.swift
//  SimpleEditor
//
//  Created by MadCow on 2025/1/31.
//

import ComposableArchitecture

@Reducer
struct SettingFeature {
    @ObservableState
    struct State {
        
    }
    
    enum Action {
        case temp
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .temp:
                return .none
            }
        }
    }
}
