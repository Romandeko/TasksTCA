//
//  BindingsState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 28.10.23.
//

import Foundation
import SwiftUI

// MARK: - BindingState

public struct BindingsState: Equatable {
    
    // MARK: - PicableColor
    
    /// Tint color variants
    public enum PicableColor: String, CaseIterable {
        
        // MARK: - Cases
        
        case red
        case blue
        case green
        case purple
        case orange
        
        // MARK: - Properties
        
        public var color: Color {
            switch self {
            case .red:
                return .red
            case .blue:
                return .blue
            case .green:
                return .green
            case .purple:
                return .purple
            case .orange:
                return .orange
            }
        }
    }
    
    // MARK: - Properties
    
    /// Tint color variants
    public let colors = PicableColor.allCases
    
    /// Picked tint color
    public var pickerColor = PicableColor.orange
    
    /// Current slider value
    public var sliderValue = 0.0
    
    /// Max value of the slider
    public var sliderMaxValue: Double {
        isCounterExists ? Double(counter?.resultNumber ?? 1) : 10.0
    }
    
    /// If counter exists
    public var isCounterExists = true
    
    // MARK: - Children
    
    /// Optional CounterState instance
    public var counter: CounterState? = CounterState(resultNumber: 1)
}
