import SwiftUI

// 1. Data model
struct Game {
    let targetWord: String
    var guesses: [String] = []
    
    mutating func addGuess(_ guess: String) {
        guesses.append(guess)
    }
    
    func isCorrect(_ guess: String) -> Bool {
        return guess.lowercased() == targetWord.lowercased()
    }
    
    func correctCharacters(_ guess: String) -> (correctPosition: Int, incorrectPosition: Int) {
        var correctPosition = 0
        var incorrectPosition = 0
        var targetWordChars = Array(targetWord)
        var guessChars = Array(guess)
        
        for (index, char) in guessChars.enumerated() {
            if char == targetWordChars[index] {
                correctPosition += 1
                targetWordChars[index] = "-"
                guessChars[index] = "_"
            }
        }
        
        for char in guessChars {
            if let index = targetWordChars.firstIndex(of: char) {
                incorrectPosition += 1
                targetWordChars[index] = "-"
            }
        }
        
        return (correctPosition, incorrectPosition)
    }
}

// 2. Random word selection
func getRandomWord() -> String {
    
    // adding more words
    
    
    let wordList = ["apple", "orange", "banana", "pear", "kiwi", "waterlelon", "piano", "computer", "games", "friend", "code", "laugh", "god", "hello", "love", "hate", "high", "score", "smart", "idiot", "dump", "out", "soft", "sofa", "nice", "group", "what", "where", "wordle", "play", "count", "music"]
    let randomIndex = Int.random(in: 0..<wordList.count)
    return wordList[randomIndex]
}

// 3. SwiftUI view
struct ContentView: View {
    @State private var game = Game(targetWord: getRandomWord())
    @State private var currentGuess = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Wordle")
                    .font(.largeTitle)
                    .padding()
                Text("Guess the \(game.targetWord.count) letter word")
                TextField("Enter your guess", text: $currentGuess, onCommit: {
                    game.addGuess(currentGuess)
                    currentGuess = ""
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
                List(game.guesses, id: \.self) { guess in
                    HStack {
                        Text(guess)
                            .font(.headline)
                        
                        Spacer()
                        
                        let (correctPosition, incorrectPosition) = game.correctCharacters(guess)
                        Text("✅ \(correctPosition)")
                        Text("⭐️ \(incorrectPosition)")
                    }
                    if game.isCorrect(currentGuess) {
                        Text("You Win!")
                    }
                }
            }
        }
    }
}

