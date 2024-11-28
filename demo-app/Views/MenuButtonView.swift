//
//  MenuButtonView.swift
//  demo-app
//
//  Created by mohammad eslamnia  on 2024-11-28.
//

import SwiftUI

struct MenuButtonView: View {
    @Binding var isMenuExpanded: Bool
    let toggleMenu: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Button(action: toggleMenu) {
                Text("menu")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                    .background(Color.green)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 5)
                    )
                    .cornerRadius(5)
            }
            .padding(.trailing, 35)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.green)
        .frame(height: 75)
    }
}
