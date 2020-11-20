# CircularText

Convenient SwiftUI view which place string along specified circle.

## image
<img src="https://user-images.githubusercontent.com/6419800/99757920-c72eed80-2b33-11eb-8e2f-05f371940e8f.png" alt="CircularText" title="snapshot of CircularText (and Circle)" width="300">

## initializer
```swift
public init(displayText:Binding<String>,
            radius: Binding<CGFloat>,
            font: Binding<Font> = .constant(.body),
            color: Binding<Color> = .constant(.black),
            startAngle: Binding<Double> = .constant(0),
            endAngle: Binding<Double?> = .constant(nil),
            stepAngle: Binding<Double> = .constant(4),
            clockwise: Binding<Bool> = .constant(true)) {
    ...
}
```
View will display displayText with specified font/color along circle which has specified radius between startAngle and end Angle.
or if endAngle is Not given, each character will placed every 4 degree. (or you can specify step degree too).

displayText and radius is mandatory arguments.

## code example

```swift
import SwiftUI
import CircularText

struct ContentView: View {
    @State var text1 = "This is a pen."
    let width:CGFloat = 30
    let radius:CGFloat = 150
    var body: some View {
        ZStack {
            Circle()
                .inset(by: width/2)
                .stroke(Color.gray, lineWidth: 30)
            CircularText(displayText: $text1, radius: .constant(radius-15), color: .constant(.red))
        }
        .frame(width: radius * 2, height: radius * 2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
