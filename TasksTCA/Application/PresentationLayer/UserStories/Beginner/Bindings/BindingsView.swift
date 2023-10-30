//
//  BindingsView.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 28.10.23.
//

import Foundation
import SwiftUI
import TCA

// MARK: - BindingsView

public struct BindingsView: View {
    
    // MARK: - Properties
    
    /// The store powering the `BindingsReducer` reducer
    public let store: StoreOf<BindingsReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 15) {
                Picker(
                    "",
                    selection: viewStore.binding(
                        get: \.pickedColor,
                        send: BindingsAction.setPickerValue
                    )
                ) {
                    ForEach(viewStore.colors, id: \.self) {
                        Text($0.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                HStack(spacing: 0) {
                    Text("Hide counter")
                        .foregroundColor(viewStore.pickedColor.color)
                        .font(.system(size: 23))
                    Toggle(
                        "",
                        isOn: viewStore.binding(
                            get: \.isCounterExists,
                            send: BindingsAction.setToggleValue
                        )
                    )
                    .toggleStyle(
                        SwitchToggleStyle(
                            tint: viewStore.pickedColor.color
                        )
                    )
                }
                IfLetStore(
                    store.scope(
                        state: \.counter,
                        action: BindingsAction.counter
                    ),
                    then: { store in
                        HStack(spacing: 0) {
                            Text("Change slider's max value")
                                .font(.system(size: 15))
                            Spacer()
                            CounterView(store: store)
                        }
                    },
                    else: Text("Where is counter???")
                        .font(.system(size: 25))
                )
                Slider(value: viewStore.binding(
                    get: \.sliderValue,
                    send: BindingsAction.setSliderValue
                ),
                       in: 0...viewStore.sliderMaxValue,
                       step: 1)
                .accentColor(viewStore.pickedColor.color)
            }
            .padding(.horizontal, 20)
        }
    }
}

// MARK: - Previews

struct BindingsView_Previews: PreviewProvider {
    static var previews: some View {
        BindingsView(
            store: Store(
                initialState: BindingsState(),
                reducer: BindingsReducer()
            )
        )
    }
}
