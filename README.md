# CircularText

Convenient SwiftUI view which place string along specified circle.

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
