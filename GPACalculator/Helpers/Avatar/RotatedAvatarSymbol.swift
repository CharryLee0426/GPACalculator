//
//  RotatedAvatarSymbol.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//

import SwiftUI

struct RotatedAvatarSymbol: View {
    let angle: Angle
    
    var body: some View {
        AvatarSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedAvatarSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedAvatarSymbol(angle: Angle(degrees: 5))
    }
}
