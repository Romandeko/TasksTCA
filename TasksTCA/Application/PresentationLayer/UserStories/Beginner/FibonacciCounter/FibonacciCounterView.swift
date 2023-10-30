//
//  CounterView.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 25.10.23.
//

import TCA
import SwiftUI

// MARK: - FibonacciCounterView

public struct FibonacciCounterView: View {
    
    // MARK: - Properties
    
    /// The store powering the `FibonacciCounter` reducer
    public let store: StoreOf<FibonacciCounterReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 10) {
                Text("Result: \(viewStore.fiboNumber)")
                    .font(.system(size: 17))
                CounterView(
                    store: store.scope(
                        state: \.counter,
                        action: FibonacciCounterAction.counter
                    )
                )
                Button {
                    viewStore.send(.resetButtonTapped)
                } label: {
                    Text("Reset")
                        .foregroundColor(viewStore.isResetDisabled ? .gray : .black)
                        .font(.system(size: 17))
                        .padding(.vertical, 3)
                }
                .disabled(viewStore.isResetDisabled)
                .padding(.horizontal)
                .background(Color.hex("DDDDDD"))
                .cornerRadius(6)
            }
        }
    }
}

// MARK: - Previews

struct FibonacciCounterView_Previews: PreviewProvider {
    static var previews: some View {
        FibonacciCounterView(
            store: Store(
                initialState: FibonacciCounterState(fiboNumber: 0),
                reducer: FibonacciCounterReducer()
            )
        )
    }
}
