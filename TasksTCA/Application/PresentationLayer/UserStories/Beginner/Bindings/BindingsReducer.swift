//
//  BindingsReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 28.10.23.
//

import Foundation
import ComposableArchitecture

// MARK: - BindingsReducer

public struct BindingsReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<BindingsState, BindingsAction> {
        Reduce { state, action in
            switch action  {
            case .setToggleValue(let value):
                state.counter = value ? CounterState() : nil
                state.isCounterExists = value
            case .setSliderValue(let value):
                state.sliderValue = value
            case .setPickerColorValue(let value):
                state.pickerColor = value
            default:
                break
            }
            return .none
        }
        .ifLet(\.counter, action: /BindingsAction.counter) {
            CounterReducer()
        }
    }
}
