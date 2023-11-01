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
        NavigationModuleView(
            store: Store(
                initialState: NavigationModuleState(),
                reducer: NavigationModuleReducer()
            )
        )
    }
}

