//
//  Workout.swift
//  ReduxTestProject
//
//  Created by Nebo on 06.07.2024.
//

import Foundation

struct Workout: Identifiable {
    let id: UUID = .init()
    let name: String
    let distance: Int
    let date: Date
    let complexity: Complexity
}

enum Complexity: Int {
    case low
    case medium
    case high
}
