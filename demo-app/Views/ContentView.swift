//
//  ContentView.swift
//  demo-app
//
//  Created by mohammad eslamnia  on 2024-11-28.
//

import SwiftUI

struct ContentView: View {
    @State var menuItems: [MenuItem] = [
        MenuItem(icon: "house.fill"),
        MenuItem(icon: "gearshape.fill"),
        MenuItem(icon: "person.fill"),
        MenuItem(icon: "bell.fill"),
        MenuItem(icon: "questionmark.circle.fill")
    ]
    @State var isMenuExpanded: Bool = false
    @State private var appearItems: [Bool] = [false, false, false, false, false]
    @State private var bottomOffset: CGFloat = -55
    @State private var dragOffsets: [CGFloat] = [0, 0, 0, 0, 0]

    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer()
                MenuButtonView(isMenuExpanded: $isMenuExpanded, toggleMenu: toggleMenu)
            }.edgesIgnoringSafeArea(.bottom)

            if isMenuExpanded {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack(spacing: 20) {
                            ForEach(menuItems.indices, id: \.self) { index in
                                if appearItems[index] {
                                    MenuOptionView(
                                        menuItem: menuItems[index],
                                        dragOffset: $dragOffsets[index],
                                        opacity: getOpacity(for: dragOffsets[index]),
                                        onRemove: { removeItem(at: index) }
                                    )
                                }
                            }
                        }
                        .padding(.trailing, 60)
                        .offset(y: bottomOffset)
                    }
                }
            }
        }
    }

    func getOpacity(for dragOffset: CGFloat) -> Double {
        let normalizedOffset = min(0, dragOffset)
        return 1.0 - min(Double(abs(normalizedOffset)) / 100.0, 1.0)
    }

    func toggleMenu() {
        if isMenuExpanded {
            for index in appearItems.indices.reversed() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                    withAnimation {
                        appearItems[index] = false
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(appearItems.count) * 0.1) {
                withAnimation {
                    isMenuExpanded = false
                }
            }
        } else {
            isMenuExpanded = true
            for index in appearItems.indices {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                    withAnimation {
                        appearItems[index] = true
                    }
                }
            }
        }
    }

    func removeItem(at index: Int) {
        menuItems.remove(at: index)
        appearItems.remove(at: index)
        dragOffsets.remove(at: index)
    }
}
