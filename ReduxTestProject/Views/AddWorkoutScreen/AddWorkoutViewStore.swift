//
//  AddWorkoutViewStore.swift
//  ReduxTestProject
//
//  Created by Nebo on 06.07.2024.
//

import Foundation
import Combine

class AddWorkoutViewStore: ObservableObject {
    
    @Published var nameText: String = ""
    @Published var distanceText: String = ""
    @Published var complexityField: Complexity = .medium
    @Published var dateField: Date = Date()
    
    func getNewWorkout() -> Workout {
        Workout(name: nameText, distance: Int(distanceText) ?? 0, date: dateField, complexity: complexityField)
    }
}
