//
//  InteractiveListItemView.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 2.11.23.
//

import SwiftUI
import ComposableArchitecture

// MARK: - InteractiveListItemView

public struct InteractiveListItemView: View {
    
    // MARK: - Properties
    
    /// The store powering the `InteractiveListItem` Reducer
    public let store: StoreOf<InteractiveListItemReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack(spacing: 5) {
                Circle()
                    .fill(Color(hex: viewStore.color))
                    .frame(width: 20, height: 20)
                Text(viewStore.title)
                    .font(.system(size: 20))
                Spacer()
                Image(systemName: viewStore.image)
                    .renderingMode(.original)
                Button(
                    action: {
                        viewStore.send(.checkBoxToggled)
                    }
                ) {
                    Image (
                        systemName: viewStore.isChecked
                        ? "checkmark.square"
                        : "square"
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(viewStore.isChecked ? .gray : nil)
                .frame(height: 40)
            }
        }
    }
}
