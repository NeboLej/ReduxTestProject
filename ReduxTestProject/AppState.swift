//
//  AppState.swift
//  ReduxTestProject
//
//  Created by Nebo on 06.07.2024.
//

import Foundation

struct AppState {
    var workouts: [Workout]
    var sortType: SortType?
}

enum SortType {
    case distance
    case complexity
}
