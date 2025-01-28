//
//  AddFeature.swift
//  SimpleEditor
//
//  Created by MadCow on 2025/1/28.
//

import ComposableArchitecture

@Reducer
struct AddFeature {
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        case addAction
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addAction:
                return .none
            }
        }
    }
}
