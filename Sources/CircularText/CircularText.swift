//
//  CircularText.swift
//
//  Created by : Tomoaki Yagishita on 2020/11/20
//  © 2020  SmallDeskSoftware
//

import SwiftUI

struct CircularText: View {
    @Binding var displayText: String
    @Binding var font: Font
    @Binding var color: Color
    @Binding var radius: CGFloat
    @Binding var startAngle: Double
    @Binding var endAngle: Double?
    @Binding var stepAngle: Double
    @Binding var clockwise: Bool

    public init(displayText:Binding<String>,
                radius: Binding<CGFloat>,
                font: Binding<Font> = .constant(.body),
                color: Binding<Color> = .constant(.black),
                startAngle: Binding<Double> = .constant(0),
                endAngle: Binding<Double?> = .constant(nil),
                stepAngle: Binding<Double> = .constant(4),
                clockwise: Binding<Bool> = .constant(true)) {
        self._displayText = displayText
        self._font = font
        self._color = color
        self._radius = radius
        self._startAngle = startAngle
        self._endAngle = endAngle
        self._stepAngle = stepAngle
        self._clockwise = clockwise
    }

    var body: some View {
        ZStack {
            ForEach(0..<displayText.count) { index in
                Text(String(Array(displayText)[index]))
                    .font(font)
                    .foregroundColor(color)
                    .position(x: radius, y: 0)
                    .rotationEffect(calcAngle(index))
            }
        }
        .frame(width: radius*2, height: radius*2)
    }
    
    func calcAngle(_ index:Int) -> Angle {
        var step: Double
        if let endAngle = endAngle {
             // calc step from start/end
            step = (endAngle - startAngle) / Double(displayText.count)
        } else {
            // with static step
            step = stepAngle
        }
        step = (clockwise ? step : (-1)*step)
        return Angle(degrees: (startAngle + Double(index) * step))
    }

}

struct CircularText_Previews: PreviewProvider {
    static var previews: some View {
        CircularText(displayText: .constant("text along circle"),
                     radius: .constant(200),
                     font:.constant(.largeTitle),
                     color: .constant(.black),
                     startAngle: .constant(45),
                     endAngle: .constant(180),
                     stepAngle: .constant(10),
                     clockwise: .constant(true))
    }
}
