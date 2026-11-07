import SwiftUI

struct ContentView: View {
    @State var chancerand = 0
    @State var communityrand = 0
    @State var community = ["", "1", "2", "3", "4", "5", "6"]
    @State var chance = ["","Your building and loan matures (Collect $150)","Go back 3 spaces","If you pass go, collect $200","Bank pays you dividend of $50","Go out of Jail free","Pay poor tax of $15"]
    var body: some View {
        Text("Drawing Cards")
        VStack{
            Button(action: {
                chancerand = Int.random(in: 1...6)
            }) {
                Image("chance")
                    .resizable()
                    .frame(width: 100, height: 100,alignment: .leading)
            }
            Text(chance[chancerand])
                .font(.system(size: 12))
                .frame(width: 100, height: 100,alignment: .topLeading)
        }
        
        VStack{
            Button(action: {
                communityrand = Int.random(in: 1...6)
            }) {
                Image("community")
                    .resizable()
                    .frame(width: 100, height: 100,alignment: .leading)
            }
            Text(community[communityrand])
                .font(.system(size: 12))
                .frame(width: 100, height: 100,alignment: .leading)
        }
        
        Button(action: {
            chancerand = 0
        }) {
            Text("Reset")
                .fontWeight(.bold)
                .font(.system(size: 25))
                .foregroundColor(.red)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10))
                .stroke(lineWidth: 2)
        }
    }
}
