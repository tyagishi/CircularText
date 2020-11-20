//
//  CircularText.swift
//
//  Created by : Tomoaki Yagishita on 2020/11/20
//  © 2020  SmallDeskSoftware
//

import SwiftUI

/// place string along circle
public struct CircularText: View {
    var displayText: String
    var font: Font
    var color: Color
    var radius: CGFloat
    var startAngle: Double
    var endAngle: Double?
    var stepAngle: Double
    var clockwise: Bool

    /// constructor
    public init(displayText:String,
                radius: CGFloat,
                font: Font = .body,
                color: Color = .black,
                startAngle:Double = 0.0,
                endAngle: Double? = nil,
                stepAngle: Double = 4,
                clockwise: Bool = true) {
        self.displayText = displayText
        self.font = font
        self.color = color
        self.radius = radius
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.stepAngle = stepAngle
        self.clockwise = clockwise
    }

    public var body: some View {
        ZStack {
            ForEach(0..<displayText.count, id: \.self) { index in
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
        CircularText(displayText: "text along circle",
                     radius: 200,
                     font:.largeTitle,
                     color: .black,
                     startAngle: 45,
                     endAngle: 180,
                     stepAngle: 10,
                     clockwise: true)
    }
}
