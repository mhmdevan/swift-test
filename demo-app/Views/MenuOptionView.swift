//
//  MenuOptionView.swift
//  demo-app
//
//  Created by mohammad eslamnia  on 2024-11-28.
//

import SwiftUI

struct MenuOptionView: View {
    let menuItem: MenuItem
    @Binding var dragOffset: CGFloat
    let opacity: Double
    let onRemove: () -> Void

    var body: some View {
        Image(systemName: menuItem.icon)
            .font(.system(size: 24))
            .foregroundColor(.white)
            .frame(width: 70, height: 50)
            .background(Color.green)
            .clipShape(Circle())
            .shadow(radius: 5)
            .offset(x: dragOffset)
            .opacity(opacity)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation.width
                    }
                    .onEnded { value in
                        if value.translation.width < -100 {
                            withAnimation {
                                onRemove()
                            }
                        } else {
                            withAnimation {
                                dragOffset = 0
                            }
                        }
                    }
            )
    }
}

