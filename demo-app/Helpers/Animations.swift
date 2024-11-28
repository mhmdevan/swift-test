//
//  Animations.swift
//  demo-app
//
//  Created by mohammad eslamnia  on 2024-11-28.
//

import SwiftUI

struct Animations {
    static func menuOptionAppear(index: Int) -> Animation {
        Animation.interpolatingSpring(stiffness: Double.random(in: 50...100), damping: Double.random(in: 5...10))
            .delay(Double(index) * 0.1)
    }
}
