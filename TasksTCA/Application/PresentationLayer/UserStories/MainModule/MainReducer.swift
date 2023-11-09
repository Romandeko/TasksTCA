//
//  MainReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 30.10.23.
//

import Foundation
import ComposableArchitecture
import HTTPTransport

// MARK: - MainReducer

public struct MainReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<MainState, MainAction> {
        Reduce { state, action in
            switch action {
            case .onModuleItemTap(let moduleType):
                switch moduleType {
                case .beginner(.counter):
                    return .send(.setCounterActive(true))
                case .beginner(.fiboCounter):
                    return .send(.setFiboCounterActive(true))
                case .beginner(.doubleCounter):
                    return .send(.setDoubleCounterActive(true))
                case .beginner(.bindings):
                    return .send(.setBindingsActive(true))
                case .intermediate(.interactiveList):
                    return .send(.setInteractiveListActive(true))
                case .intermediate(.firstSpaceNewsList):
                    return .send(.setFirstSpaceNewsListActive(true))
                case .intermediate(.secondSpaceNewsList):
                    return .send(.setSecondSpaceNewsListActive(true))
                }
            case .setCounterActive(let isActive):
                state.counter = isActive ? CounterState() : nil
                state.isCounterActive = isActive
                state.modulesInfo[.beginner(.counter), default: 0] += isActive ? 1 : 0
            case .setFiboCounterActive(let isActive):
                state.fiboCounter = isActive ? FibonacciCounterState() : nil
                state.isFiboCounterActive = isActive
                state.modulesInfo[.beginner(.fiboCounter), default: 0] += isActive ? 1 : 0
            case .setDoubleCounterActive(let isActive):
                state.doubleCounter = isActive ? DoubleCounterState() : nil
                state.isDoubleCounterActive = isActive
                state.modulesInfo[.beginner(.doubleCounter), default: 0] += isActive ? 1 : 0
            case .setBindingsActive(let isActive):
                state.bindings = isActive ? BindingsState() : nil
                state.isBindingsActive = isActive
                state.modulesInfo[.beginner(.bindings), default: 0] += isActive ? 1 : 0
            case .setInteractiveListActive(let isActive):
                state.interactiveList = isActive ? InteractiveListState() : nil
                state.isInteractiveListActive = isActive
                state.modulesInfo[.intermediate(.interactiveList), default: 0] += isActive ? 1 : 0
            case .setFirstSpaceNewsListActive(let isActive):
                state.firstSpaceNewsList = isActive ? SpaceNewsListState(transitionType: .instant) : nil
                state.isFirstSpaceNewsListActive = isActive
                state.modulesInfo[.intermediate(.firstSpaceNewsList), default: 0] += isActive ? 1 : 0
            case .setSecondSpaceNewsListActive(let isActive):
                state.secondSpaceNewsList = isActive ? SpaceNewsListState(transitionType: .deferred) : nil
                state.isSecondSpaceNewsListActive = isActive
                state.modulesInfo[.intermediate(.secondSpaceNewsList), default: 0] += isActive ? 1 : 0
            default:
                return .none
            }
            return .none
        }
        .ifLet(\.counter, action: /MainAction.counter) {
            CounterReducer()
        }
        .ifLet(\.fiboCounter, action: /MainAction.fibonacciCounter) {
            FibonacciCounterReducer()
        }
        .ifLet(\.doubleCounter, action: /MainAction.doubleCounter) {
            DoubleCounterReducer()
        }
        .ifLet(\.bindings, action: /MainAction.bindings) {
            BindingsReducer()
        }
        .ifLet(\.interactiveList, action: /MainAction.interactiveList) {
            InteractiveListReducer()
        }
        .ifLet(\.firstSpaceNewsList, action: /MainAction.firstSpaceNewsList) {
            SpaceNewsListReducer(
                articlesService: ArticleServiceImplementation(
                    transport: HTTPTransport()
                )
            )
        }
        .ifLet(\.secondSpaceNewsList, action: /MainAction.secondSpaceNewsList) {
            SpaceNewsListReducer(
                articlesService: ArticleServiceImplementation(
                    transport: HTTPTransport()
                )
            )
        }
    }
}
