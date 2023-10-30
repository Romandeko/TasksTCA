//
//  NavigationModuleView.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 30.10.23.
//

import SwiftUI
import ComposableArchitecture

// MARK: - NavigationModuleView

public struct NavigationModuleView: View {
    
    // MARK: - Properties
    
    /// The store powering the `NavigationModule` reducer
    public let store: StoreOf<NavigationModuleReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView  {
                List {
                    Section(header: Text("👶🏿Beginner")) {
                        NavigationLink(
                            isActive: viewStore.binding(
                                get: \.isCounterModuleActive,
                                send: NavigationModuleAction.setCounterModuleActive
                            ),
                            destination: {
                                CounterView(
                                    store: store.scope(
                                        state: \.CounterModule,
                                        action: NavigationModuleAction.counterModuleAction
                                    )
                                )
                            },
                            label: {
                                Text("Counter \(viewStore.state.modulesAppearanceStringArray[0])")
                            }
                        )
                        NavigationLink(
                            isActive: viewStore.binding(
                                get: \.isFiboCounterModuleActive,
                                send: NavigationModuleAction.setFiboCounterModuleActive
                            ),
                            destination: {
                                FibonacciCounterView(
                                    store: store.scope(
                                        state: \.FiboCounterModule,
                                        action: NavigationModuleAction.fiboCounterModuleAction
                                    )
                                )
                            },
                            label: {
                                Text("Fibonacci counter \(viewStore.state.modulesAppearanceStringArray[1])")
                            }
                        )
                        NavigationLink(
                            isActive: viewStore.binding(
                                get: \.isDoubleCounterModuleActive,
                                send: NavigationModuleAction.setDoubleCounterModuleActive
                            ),
                            destination: {
                                DoubleCounterView(
                                    store: store.scope(
                                        state: \.DoubleCounterModule,
                                        action: NavigationModuleAction.doubleCounterModuleAction
                                    )
                                )
                            },
                            label: {
                                Text("Double counter \(viewStore.state.modulesAppearanceStringArray[2])")
                            }
                        )
                        NavigationLink(
                            isActive: viewStore.binding(
                                get: \.isBindingsModuleActive,
                                send: NavigationModuleAction.setBindingsModuleActive
                            ),
                            destination: {
                                BindingsView(
                                    store: store.scope(
                                        state: \.BindingsModule,
                                        action: NavigationModuleAction.bindingsModuleAction
                                    )
                                )
                            },
                            label: {
                                Text("Bindings \(viewStore.state.modulesAppearanceStringArray[3])")
                            }
                        )
                    }
                    .font(.system(size: 17))
                }
            }
        }
    }
}

// MARK: - Previews

struct NavigationModuleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationModuleView(
            store: Store(
                initialState: NavigationModuleState(),
                reducer: NavigationModuleReducer()
            )
        )
    }
}

