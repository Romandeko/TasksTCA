//
//  BindingsReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 28.10.23.
//

import Foundation
import TCA

// MARK: - BindingsReducer

public struct BindingsReducer: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<BindingsState, BindingsAction> {
        Reduce { state, action in
            switch action  {
            case .setToggleValue(let value):
                state.counter = value ? CounterState() : nil
                state.isCounterExists = value
            case .setSliderValue(let value):
                state.sliderValue = value
            case .setPickerValue(let value):
                state.pickedColor = value
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
