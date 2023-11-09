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
            case .onBeginnerModuleItemTap(let moduleType):
                switch moduleType {
                case .counter:
                    return .send(.setCounterActive(true))
                case .fiboCounter:
                    return .send(.setFiboCounterActive(true))
                case .doubleCounter:
                    return .send(.setDoubleCounterActive(true))
                case .bindings:
                    return .send(.setBindingsActive(true))
                }
            case .onIntermediateModuleItemTap(let moduleType):
                switch moduleType {
                case .interactiveList:
                    return .send(.setInteractiveListActive(true))
                case .firstSpaceNewsList:
                    return .send(.setFirstSpaceNewsListActive(true))
                case .secondSpaceNewsList:
                    return .send(.setSecondSpaceNewsListActive(true))
                }
            case .setCounterActive(let isActive):
                state.counter = isActive ? CounterState() : nil
                state.isCounterActive = isActive
                state.beginnerModulesInfo[.counter, default: 0] += isActive ? 1 : 0
            case .setFiboCounterActive(let isActive):
                state.fiboCounter = isActive ? FibonacciCounterState() : nil
                state.isFiboCounterActive = isActive
                state.beginnerModulesInfo[.fiboCounter, default: 0] += isActive ? 1 : 0
            case .setDoubleCounterActive(let isActive):
                state.doubleCounter = isActive ? DoubleCounterState() : nil
                state.isDoubleCounterActive = isActive
                state.beginnerModulesInfo[.doubleCounter, default: 0] += isActive ? 1 : 0
            case .setBindingsActive(let isActive):
                state.bindings = isActive ? BindingsState() : nil
                state.isBindingsActive = isActive
                state.beginnerModulesInfo[.bindings, default: 0] += isActive ? 1 : 0
            case .setInteractiveListActive(let isActive):
                state.interactiveList = isActive ? InteractiveListState() : nil
                state.isInteractiveListActive = isActive
                state.intermediateModulesInfo[.interactiveList, default: 0] += isActive ? 1 : 0
            case .setFirstSpaceNewsListActive(let isActive):
                state.firstSpaceNewsList = isActive ? SpaceNewsListState(transitionType: .instant) : nil
                state.isFirstSpaceNewsListActive = isActive
                state.intermediateModulesInfo[.firstSpaceNewsList, default: 0] += isActive ? 1 : 0
            case .setSecondSpaceNewsListActive(let isActive):
                state.secondSpaceNewsList = isActive ? SpaceNewsListState(transitionType: .deferred) : nil
                state.isSecondSpaceNewsListActive = isActive
                state.intermediateModulesInfo[.secondSpaceNewsList, default: 0] += isActive ? 1 : 0
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
