//
//  AddWorkoutView.swift
//  ReduxTestProject
//
//  Created by Nebo on 06.07.2024.
//

import SwiftUI

struct AddWorkoutView: View {
    
    @EnvironmentObject private var store: Store
    @Binding var isAddingMode: Bool
    
    @ObservedObject var viewStore = AddWorkoutViewStore()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $viewStore.nameText)
                TextField("Distance", text: $viewStore.distanceText)
                Picker(selection: $viewStore.complexityField, label: Text("Complexity")) {
                    Text("Low").tag(Complexity.low)
                    Text("Medium").tag(Complexity.medium)
                    Text("High").tag(Complexity.high)
                }
                DatePicker(selection: $viewStore.dateField, displayedComponents: .date) {
                    Text("Date")
                }
            }
            .navigationBarTitle("Workout Details", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: { self.isAddingMode = false }) {
                    Text("Cancel")
                },
                trailing: Button(action: {
                    self.store.dispatch(action: .addWorkout(viewStore.getNewWorkout()))
                    self.isAddingMode = false
                }) {
                    Text("Save")
                }
                .disabled(viewStore.nameText.isEmpty)
            )
        }
    }
}
