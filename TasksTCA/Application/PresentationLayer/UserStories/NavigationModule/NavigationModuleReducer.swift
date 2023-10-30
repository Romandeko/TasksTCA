//
//  NavigationModuleReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 30.10.23.
//

import Foundation
import ComposableArchitecture

// MARK: - NavigationModuleReducer

public struct NavigationModuleReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<NavigationModuleState, NavigationModuleAction> {
        Scope(state: \.CounterModule, action: /NavigationModuleAction.counterModuleAction) {
            CounterReducer()
        }
        Scope(state: \.FiboCounterModule, action: /NavigationModuleAction.fiboCounterModuleAction) {
            FibonacciCounterReducer()
        }
        Scope(state: \.DoubleCounterModule, action: /NavigationModuleAction.doubleCounterModuleAction) {
            DoubleCounterReducer()
        }
        Scope(state: \.BindingsModule, action: /NavigationModuleAction.bindingsModuleAction) {
            BindingsReducer()
        }
        Reduce { state, action in
            switch action {
            case .setCounterModuleActive(let isActive):
                state.isCounterModuleActive = isActive
                if isActive {
                    state.modulesAppearanceArray[0] += 1
                }
            case .setFiboCounterModuleActive(let isActive):
                state.isFiboCounterModuleActive = isActive
                if isActive {
                    state.modulesAppearanceArray[1] += 1
                }
            case .setDoubleCounterModuleActive(let isActive):
                state.isDoubleCounterModuleActive = isActive
                if isActive {
                    state.modulesAppearanceArray[2] += 1
                }
            case .setBindingsModuleActive(let isActive):
                state.isBindingsModuleActive = isActive
                if isActive {
                    state.modulesAppearanceArray[3] += 1
                }
            default:
                return .none
            }
            return .none
        }
    }
}
