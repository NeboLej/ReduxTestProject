//
//  TrailingView.swift
//  ReduxTestProject
//
//  Created by Nebo on 06.07.2024.
//

import SwiftUI

struct TrailingView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            Button(action: {
                switch self.store.state.sortType {
                case .distance:
                    self.store.dispatch(action: .sort(by: .distance))
                default:
                    self.store.dispatch(action: .sort(by: .complexity))
                }
            }) {
                Image(systemName: "arrow.up.arrow.down")
            }
            EditButton()
        }
    }
}
