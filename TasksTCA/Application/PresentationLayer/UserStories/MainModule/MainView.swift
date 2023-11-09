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
                        ForEach(viewStore.beginnerModuleTypes, id: \.self) { moduleType in
                            ModuleItemView (
                                title: moduleType.rawValue,
                                subtitle: viewStore.moduleItemInfoText(moduleType),
                                onTapAction: {
                                    print(moduleType.rawValue)
                                    viewStore.send(.onModuleItemTap(moduleType))
                                }
                            )
                        }
                    }
                /*    Section(header: Text("🧑🏾 Intermediate")) {
                        ForEach(viewStore.intermediateModuleTypes, id: \.self) { moduleType in
                            ModuleItemView (
                                title: moduleType.rawValue,
                                subtitle: viewStore.intermediateModuleItemInfoText(moduleType),
                                onTapAction: {
                                    viewStore.send(.onIntermediateModuleItemTap(moduleType))
                                }
                            )
                        }
                    }*/
                }
                .font(.system(size: 17))
                .foregroundColor(.black)
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
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isInteractiveListActive,
                            send: MainAction.setInteractiveListActive
                        ),
                        destination: {
                            IfLetStore(
                                store.scope(
                                    state: \.interactiveList,
                                    action: MainAction.interactiveList
                                ), then: { store in
                                    InteractiveListView(store: store)
                                }
                            )
                        },
                        label: { EmptyView() }
                    )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isFirstSpaceNewsListActive,
                            send: MainAction.setFirstSpaceNewsListActive
                        ),
                        destination: {
                            IfLetStore(
                                store.scope(
                                    state: \.firstSpaceNewsList,
                                    action: MainAction.firstSpaceNewsList
                                ), then: { store in
                                    SpaceNewsListView(store: store)
                                }
                            )
                        },
                        label: { EmptyView() }
                    )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isSecondSpaceNewsListActive,
                            send: MainAction.setSecondSpaceNewsListActive
                        ),
                        destination: {
                            IfLetStore(
                                store.scope(
                                    state: \.secondSpaceNewsList,
                                    action: MainAction.secondSpaceNewsList
                                ), then: { store in
                                    SpaceNewsListView(store: store)
                                }
                            )
                        },
                        label: { EmptyView() }
                    )
                )
            }
            .navigationViewStyle(.stack)
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
            HStack(spacing: 5) {
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
