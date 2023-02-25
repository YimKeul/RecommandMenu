//
//  TestRoulettee.swift
//  RecommandMenu
//
//  Created by yimkeul on 2023/02/25.
//

import SwiftUI
//import SimpleRoulette

struct RouletteFillColor: View {
    
    @State var slices: [(Double, Color)]
    
    var body: some View {
        Canvas { context, size in
            let total = slices.reduce(0) { $0 + $1.0 }
            context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
            var pieContext = context
            pieContext.rotate(by: .degrees(-90))
            let radius = min(size.width, size.height) * 0.48
            var startAngle = Angle.zero
            for (value, color) in slices {
                let angle = Angle(degrees: 360 * (value / total))
                let endAngle = startAngle + angle
                let path = Path { p in
                    p.move(to: .zero)
                    p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                    p.closeSubpath()
                }
                pieContext.fill(path, with: .color(color))
                
                startAngle = endAngle
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}




struct RouletteFillColor_Previews: PreviewProvider {
    static var previews: some View {
        RouletteFillColor(slices: [
            (2, .red),
            (3, .orange),
            (4, .yellow),
            (1, .green),
            (5, .blue),
            (4, .indigo),
            (2, .purple)
        ])
    }
}

