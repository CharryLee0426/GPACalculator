//
//  Avatar.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//  Description: System Default Avatar
//  Structure: RotatedAvatarSymbol * 8
//                                    (with different offset degrees)
//             AvatarBackground
//  Usage: For the need of personalization, hueRotation can change
//         the hue(means color and shade) to get different avatars
//         Avatar().hueRotation(Angle(degree: Double))
//  Suggestion: Best Scale Radio is 1.0 / 3.0

import SwiftUI

struct Avatar: View {
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedAvatarSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            AvatarBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar()
    }
}
