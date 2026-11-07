import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    var body: some View {
        VStack {
            Text("Kurtis's Counter App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.red)
            HStack {
                Button(" +  ") {
                    count = count + 1
                    
                }
                .border(.yellow, width: 3)
                .background(.yellow)
                .foregroundColor(.green)
                
                Button(" Reset ") {
                    count = 0
                }
                .border(.yellow, width: 3)
                .background(.yellow)
                .foregroundColor(.blue)
                
                Button(" -  ") {
                    count = count - 1
                }
                .border(.yellow, width: 3)
                .background(.yellow)
                .foregroundColor(.purple)
            }
            Text(String( count ))
                .font(.subheadline)
                .fontWeight(.heavy)
                .foregroundColor(.brown)
                .background(.cyan)
        }
    }
}
