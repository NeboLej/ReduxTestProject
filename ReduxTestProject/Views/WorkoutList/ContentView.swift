//
//  ContentView.swift
//  ReduxTestProject
//
//  Created by Nebo on 06.07.2024.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store
    @State private var isAddingMode: Bool = false
    
    var body: some View {
        NavigationView {
            WorkoutListView()
                .navigationBarTitle("Workouts diary", displayMode: .inline)
                .navigationBarItems(
                    leading: AddButton(isAddingMode: self.$isAddingMode),
                    trailing: TrailingView()
                ).environmentObject(store)
        }
        .sheet(isPresented: $isAddingMode) {
            AddWorkoutView(isAddingMode: self.$isAddingMode)
                .environmentObject(self.store)
        }
    }
}


struct WorkoutListView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        List {
            ForEach(store.state.workouts) {
                WorkoutView(workout: $0)
            }
            .onDelete {
                self.store.dispatch(action: .removeWorkout(at: $0))
            }
            .listRowInsets(EdgeInsets())
        }
    }
}

struct WorkoutView: View {
    let workout: Workout
    
    private var backgroundColor: Color {
        switch workout.complexity {
        case .low:
            return .green
        case .medium:
            return .orange
        case .high:
            return .red
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(workout.name)
                Text("Distance:" + "\(workout.distance)" + "km")
                    .font(.subheadline)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(simpleFormat(workout.date))
            }
        }
        .padding()
        .background(backgroundColor)
    }
}

private extension WorkoutView {
    func simpleFormat(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateFormatter.locale = .init(identifier: "en_GB")
        return dateFormatter.string(from: date)
    }
}
