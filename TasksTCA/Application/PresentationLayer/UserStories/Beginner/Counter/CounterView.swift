//
//  CounterView.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 26.10.23.
//

import SwiftUI
import TCA

// MARK: - FibonacciCounterView

public struct CounterView: View {
    
    // MARK: - Properties
    
    /// The store powering the `Counter` reducer
    public let store: StoreOf<CounterReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 10) {
                HStack(spacing: 0) {
                    Button {
                        viewStore.send(.decrementButtonTapped)
                    } label: {
                        Image(systemName: "minus")
                            .padding(.horizontal, 10)
                            .foregroundColor(viewStore.isDecrementDisabled ? .gray : .black)
                    }
                    .disabled(viewStore.isDecrementDisabled)
                    Rectangle()
                        .frame(width: 1)
                        .foregroundColor(.white)
                    Text("\(viewStore.resultNumber)")
                        .padding(.horizontal, 10)
                    Rectangle()
                        .frame(width: 1)
                        .foregroundColor(.white)
                    Button {
                        viewStore.send(.incrementButtonTapped)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(viewStore.isIncrementDisabled ? .gray : .black)
                            .padding(.horizontal, 10)
                    }
                    .disabled(viewStore.isIncrementDisabled)
                }
                .frame(height: 30)
                .background(Color.hex("DDDDDD"))
                .cornerRadius(6)
            }
        }
    }
}

// MARK: - Previews

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(
            store: Store(
                initialState: CounterState(resultNumber: 0),
                reducer: CounterReducer()
            )
        )
    }
}
