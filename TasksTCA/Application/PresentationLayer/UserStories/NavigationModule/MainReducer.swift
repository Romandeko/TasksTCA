//
//  MainReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 30.10.23.
//

import Foundation
import ComposableArchitecture

// MARK: - MainReducer

public struct MainReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<MainState, MainAction> {
        Reduce { state, action in
            switch action {
            case .onModuleItemTap(let moduleType):
                switch moduleType {
                case .counter:
                    return .send(.setCounterActive(true))
                case .fiboCounter:
                    return .send(.setFiboCounterActive(true))
                case .doubleCounter:
                    return .send(.setDoubleCounterActive(true))
                case .bindings:
                    return .send(.setBindingsActive(true))
                }
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
        .ifLet(\.counter, action: /MainAction.counter) {
            CounterReducer()
        }
        .ifLet(\.fiboCounter, action: /MainAction.fibonacciCounter) {
            FibonacciCounterReducer()
        }
        .ifLet(\.doubleCounter, action: /MainAction.doubleCounter) {
            DoubleCounterReducer()
        }
        .ifLet(\.bindings, action: /MainAction.bindings) {
            BindingsReducer()
        }
    }
}
