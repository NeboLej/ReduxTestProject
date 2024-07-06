//
//  Store.swift
//  ReduxTestProject
//
//  Created by Nebo on 06.07.2024.
//

import Foundation

final class Store: ObservableObject {
     @Published private(set) var state: AppState
     
     init(state: AppState = .init(workouts: [Workout]())) {
         self.state = state
     }
     
     public func dispatch(action: Action) {
         state = reducer(state: state, action: action)
     }
 }
