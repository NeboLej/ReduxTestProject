//
//  Action.swift
//  ReduxTestProject
//
//  Created by Nebo on 06.07.2024.
//

import Foundation

enum Action {
    case addWorkout(_ workout: Workout)
    case removeWorkout(at: IndexSet)
    case sort(by: SortType)
}
