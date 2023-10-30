//
//  DoubleCounterVirw.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 26.10.23.
//

import SwiftUI
import ComposableArchitecture

// MARK: - DoubleCounterView

public struct DoubleCounterView: View {
    
    // MARK: - Properties
    
    /// The store powering the `DoubleCounter` reducer
    public let store: StoreOf<DoubleCounterReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 10) {
                HStack(alignment: .top, spacing: 10) {
                    VStack(spacing: 10) {
                        Text("№1")
                        CounterView(
                            store: store.scope(
                                state: \.firstCounter,
                                action: DoubleCounterAction.firstCounter
                            )
                        )
                    }
                    VStack(spacing: 5)  {
                        Text("Result:")
                        Text("\(viewStore.sumOfCountersValues)")
                    }
                    VStack(spacing: 10) {
                        Text("№2")
                        CounterView(
                            store: store.scope(
                                state: \.secondCounter,
                                action: DoubleCounterAction.secondCounter
                            )
                        )
                    }
                }
                Text("Counter №1:")
                Text(viewStore.firstCounterValues)
                Text("Counter №2:")
                Text(viewStore.secondCounterValues)
                Spacer()
            }
            .font(.system(size: 19))
        }
    }
}

// MARK: - Previews

struct DoubleCounterView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleCounterView(
            store: Store(
                initialState: DoubleCounterState(),
                reducer: DoubleCounterReducer()
            )
        )
    }
}
