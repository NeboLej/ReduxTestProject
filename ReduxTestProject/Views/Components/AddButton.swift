//
//  AddButton.swift
//  ReduxTestProject
//
//  Created by Nebo on 06.07.2024.
//

import SwiftUI

struct AddButton: View {
    @Binding var isAddingMode: Bool
    
    var body: some View {
        Button(action: { self.isAddingMode = true }) {
            Image(systemName: "plus")
        }
    }
}
