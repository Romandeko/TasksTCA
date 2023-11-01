//
//  MainView.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 30.10.23.
//

import SwiftUI
import ComposableArchitecture

// MARK: - MainView

public struct MainView: View {
    
    // MARK: - Properties
    
    /// The store powering the `Main` reducer
    public let store: StoreOf<MainReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List {
                    Section(header: Text("👶🏿 Beginner")) {
                        ForEach(viewStore.moduleTypes, id: \.self) { moduleType in
                            ModuleItemView (
                                title: moduleType.title,
                                subtitle: viewStore.moduleItemInfoText(moduleType),
                                onTapAction: {
                                    viewStore.send(.onModuleItemTap(moduleType))
                                }
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
                            send: MainAction.setCounterActive
                        ),
                        destination: {
                            IfLetStore(
                                store.scope(
                                    state: \.counter,
                                    action: MainAction.counter
                                ), then: { store in
                                    CounterView(store: store)
                                }
                            )
                        },
                        label: { EmptyView() }
                    )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isFiboCounterActive,
                            send: MainAction.setFiboCounterActive
                        ),
                        destination: {
                            IfLetStore(
                                store.scope(
                                    state: \.fiboCounter,
                                    action: MainAction.fibonacciCounter
                                ), then: { store in
                                    FibonacciCounterView(store: store)
                                }
                            )
                        },
                        label: { EmptyView() }
                    )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isDoubleCounterActive,
                            send: MainAction.setDoubleCounterActive
                        ),
                        destination: {
                            IfLetStore(
                                store.scope(
                                    state: \.doubleCounter,
                                    action: MainAction.doubleCounter
                                ), then: { store in
                                    DoubleCounterView(store: store)
                                }
                            )
                        },
                        label: { EmptyView() }
                    )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isBindingsActive,
                            send: MainAction.setBindingsActive
                        ),
                        destination: {
                            IfLetStore(
                                store.scope(
                                    state: \.bindings,
                                    action: MainAction.bindings
                                ), then: { store in
                                    BindingsView(store: store)
                                }
                            )
                        },
                        label: { EmptyView() }
                    )
                )
            }
        }
    }
    
    // MARK: - ModuleItemView
    
    private struct ModuleItemView: View {
        
        // MARK: - Properties
        
        /// Text for button
        private let title: String
        
        /// subtitle for button
        private let subtitle: String
        
        /// Button action
        private let onTapAction: () -> ()
        
        // MARK: - Initializers
        
        init(
            title: String,
            subtitle: String,
            onTapAction: @escaping () -> ()
        ) {
            self.title = title
            self.subtitle = subtitle
            self.onTapAction = onTapAction
        }
        
        // MARK: - View
        
        var body: some View  {
            HStack(spacing: 0) {
                Button {
                    onTapAction()
                } label: {
                    Text(title)
                }
                Spacer()
                Text(subtitle)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
    }
}

// MARK: - Previews

struct NavigationModuleView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            store: Store(
                initialState: MainState(),
                reducer: MainReducer()
            )
        )
    }
}

