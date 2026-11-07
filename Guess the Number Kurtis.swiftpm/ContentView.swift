import SwiftUI


struct ContentView: View {
    @State private var randomNumber = Int.random(in: 1...100)
    @State private var guess = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Guess the Number")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("I'm thinking of a number between 1 and 100.")
                .font(.callout)
            
            TextField("Enter your guess", text: $guess)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            
            Button("Submit") {
                checkGuess()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func checkGuess() {
        guard let userGuess = Int(guess) else {
            showAlert = true
            alertTitle = "Invalid Guess"
            alertMessage = "Please enter a valid number between 1 and 100."
            return
        }
        if userGuess == randomNumber {
            showAlert = true 
            alertTitle = "Bingo!"
            alertMessage = "You are correct! The number is \(randomNumber)"
            Int.random(in: 1...100)
        } else if userGuess < randomNumber {
            showAlert = true 
            alertTitle = "Too low!"
            alertMessage = "You need to input a higher number!"
        } else if userGuess > randomNumber {
            showAlert = true 
            alertTitle = "Too high!"
            alertMessage = "You need to input a lower number!"
        }
    }
}

