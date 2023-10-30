//
//  BindingsAction.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 28.10.23.
//

import Foundation

// MARK: - BindingsAction

public enum BindingsAction: Equatable {
    
    // MARK: - Binding
    
    /// Setter for 'sliderValue' property binding
    case setSliderValue(Double)
    
    /// Setter for 'counterExists' property binding
    case setToggleValue(Bool)
    
    /// Setter for 'pickedColor' property binding
    case setPickerColorValue(BindingsState.PicableColor)
    
    // MARK: - Children
    
    /// Actions of child module 'Counter'
    case counter(CounterAction)
}
