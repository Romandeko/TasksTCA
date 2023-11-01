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
                        ForEach(viewStore.modulesArray, id: \.self) { module  in
                            TextView (
                                text: module.text,
                                store: viewStore,
                                action: module.action
                            )
                        }
                    }
                    .font(.system(size: 17))
                    .foregroundColor(.black)
                }
                .background(
                        NavigationLink(
                            isActive: viewStore.binding(
                                get: \.isCounterActive,
                                send: NavigationModuleAction.setCounterActive
                            ),
                            destination: {
                                CounterView(
                                    store: store.scope(
                                        state: \.counter,
                                        action: NavigationModuleAction.counter
                                    )
                                )
                            },
                            label: { EmptyView() }
                        )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isFiboCounterActive,
                            send: NavigationModuleAction.setFiboCounterActive
                        ),
                        destination: {
                            FibonacciCounterView(
                                store: store.scope(
                                    state: \.fiboCounter,
                                    action: NavigationModuleAction.fibonacciCounter
                                )
                            )
                        },
                        label: { EmptyView() }
                    )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isDoubleCounterActive,
                            send: NavigationModuleAction.setDoubleCounterActive
                        ),
                        destination: {
                            DoubleCounterView(
                                store: store.scope(
                                    state: \.doubleCounter,
                                    action: NavigationModuleAction.doubleCounter
                                )
                            )
                        },
                        label: { EmptyView() }
                    )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isBindingsActive,
                            send: NavigationModuleAction.setBindingsActive
                        ),
                        destination: {
                            BindingsView(
                                store: store.scope(
                                    state: \.bindings,
                                    action: NavigationModuleAction.bindings
                                )
                            )
                        },
                        label: { EmptyView() }
                    )
                )
            }
        }
    }
    
    // MARK: - TextView
    
    private struct TextView: View {
        
        // MARK: - Properties
        
        /// Text for button
        private var text: String
        
        /// The store powering the `NavigationModule` reducer
        private var store: ViewStore<NavigationModuleState, NavigationModuleAction>
        
        /// Button action
        private var action: NavigationModuleAction
        
        // MARK: - Initializers
        
        public init(
            text: String,
            store: ViewStore<NavigationModuleState, NavigationModuleAction>,
            action: NavigationModuleAction
        ) {
            self.text = text
            self.store = store
            self.action = action
        }
        
        // MARK: - View
        
        public var body: some View  {
            VStack(spacing: 0) {
                Button {
                    store.send(action)
                } label: {
                    Text(text)
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

