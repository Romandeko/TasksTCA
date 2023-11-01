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
        Scope(state: \.counter, action: /NavigationModuleAction.counter) {
            CounterReducer()
        }
        Scope(state: \.fiboCounter, action: /NavigationModuleAction.fibonacciCounter) {
            FibonacciCounterReducer()
        }
        Scope(state: \.doubleCounter, action: /NavigationModuleAction.doubleCounter) {
            DoubleCounterReducer()
        }
        Scope(state: \.bindings, action: /NavigationModuleAction.bindings) {
            BindingsReducer()
        }
        Reduce { state, action in
            switch action {
            case .setCounterActive(let isActive):
                state.isCounterActive = isActive
                state.modulesInfo[.counter, default: 0] += isActive ? 1 : 0
            case .setFiboCounterActive(let isActive):
                state.isFiboCounterActive = isActive
                state.modulesInfo[.fiboCounter, default: 0] += isActive ? 1 : 0
            case .setDoubleCounterActive(let isActive):
                state.isDoubleCounterActive = isActive
                state.modulesInfo[.doubleCounter, default: 0] += isActive ? 1 : 0
            case .setBindingsActive(let isActive):
                state.isBindingsActive = isActive
                state.modulesInfo[.bindings, default: 0] += isActive ? 1 : 0
            default:
                return .none
            }
            return .none
        }
    }
}
