import SwiftUI


struct ContentView: View {
    @State private var currentQuestion = 0
    @State private var selectedAnswer: Int? = nil
    @State private var showAlert: Bool = false
    @State private var score = 0
    
    let quiz = [
        Question(question: "What is the capital of France?", answers: ["Berlin", "London", "Paris", "Madrid"], correctAnswer: 2),
        Question(question: "Which planet is closest to the Sun?", answers: ["Mars", "Venus", "Earth", "Mercury"], correctAnswer: 3),
        Question(question: "Which is the largest ocean on Earth?", answers: ["Atlantic Ocean", "Indian Ocean", "Southern Ocean", "Pacific Ocean"], correctAnswer: 3),
        Question(question: "What is the closet plant to earth?", answers: ["Venus", "Mercury", "Neptune", "Uranus"], correctAnswer: 0),
        Question(question: "What is the square number of 22?", answers: ["44", "66", "222", "242"], correctAnswer: 3),
        Question(question: "Which is the language used to programme this game?", answers: ["Python", "HTML", "Swift", "SQL"], correctAnswer: 2),
        Question(question: "He ___ to the bus stop", answers: ["run", "ran", "running", "runs"], correctAnswer: 0),
        Question(question: "I like to ___ chocolate", answers: ["eat", "ate", "eats", "eating"], correctAnswer: 0),
        Question(question: "What is the capital of China?", answers: ["Hong Kong", "Taiwan", "GuangDong", "Beijing"], correctAnswer: 3),
        Question(question: "What is the biggest known star?", answers: ["NA Scuti", "UY 1938+7639", "UY Scuti", "Rock 673+2938"], correctAnswer: 2)
    ]
    
    var body: some View {
        VStack {
            if currentQuestion < quiz.count {
                VStack {
                    Text(quiz[currentQuestion].question)
                        .font(.title)
                        .padding()
                    VStack {
                        ForEach(0..<quiz[currentQuestion].answers.count) { index in
                            Button(action: {
                                selectedAnswer = index
                                showAlert = true
                                if quiz[currentQuestion].correctAnswer == index {
                                    score += 1
                                }
                            }) {
                                HStack {
                                    Text("\(index + 1). \(quiz[currentQuestion].answers[index])")
                                        .font(.headline)
                                    Spacer()
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            } else {
                VStack {
                    Text("Quiz Complete!")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Your score: \(score) / \(quiz.count)")
                        .font(.title2)
                        .padding()
                    
                    Button(action: {
                        currentQuestion = 0
                        score = 0
                    }) {
                        Text("Restart Quiz")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Continue"),
                message: Text("Tap OK to continue to the next question."),
                dismissButton: .default(Text("OK")) {
                    showAlert = false
                    currentQuestion += 1
                }
            )
        }
    }
}

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: Int
}


import SwiftUI


struct ContentView: View {
    @State private var currentQuestion = 0
    @State private var selectedAnswer: Int? = nil
    @State private var showAlert: Bool = false
    @State private var score = 0
    
    let quiz = [
        Question(question: "What is the capital of France?", answers: ["Berlin", "London", "Paris", "Madrid"], correctAnswer: 2),
        Question(question: "Which planet is closest to the Sun?", answers: ["Mars", "Venus", "Earth", "Mercury"], correctAnswer: 3),
        Question(question: "Which is the largest ocean on Earth?", answers: ["Atlantic Ocean", "Indian Ocean", "Southern Ocean", "Pacific Ocean"], correctAnswer: 3),
        Question(question: "What is the closet plant to earth?", answers: ["Venus", "Mercury", "Neptune", "Uranus"], correctAnswer: 0),
        Question(question: "What is the square number of 22?", answers: ["44", "66", "222", "242"], correctAnswer: 3),
        Question(question: "Which is the language used to programme this game?", answers: ["Python", "HTML", "Swift", "SQL"], correctAnswer: 2),
        Question(question: "He ___ to the bus stop", answers: ["run", "ran", "running", "runs"], correctAnswer: 0),
        Question(question: "I like to ___ chocolate", answers: ["eat", "ate", "eats", "eating"], correctAnswer: 0),
        Question(question: "What is the capital of China?", answers: ["Hong Kong", "Taiwan", "GuangDong", "Beijing"], correctAnswer: 3),
        Question(question: "What is the biggest known star?", answers: ["NA Scuti", "UY 1938+7639", "UY Scuti", "Rock 673+2938"], correctAnswer: 2)
    ]
    
    var body: some View {
        VStack {
            if currentQuestion < quiz.count {
                VStack {
                    Text(quiz[currentQuestion].question)
                        .font(.title)
                        .padding()
                    VStack {
                        ForEach(0..<quiz[currentQuestion].answers.count) { index in
                            Button(action: {
                                selectedAnswer = index
                                showAlert = true
                                if quiz[currentQuestion].correctAnswer == index {
                                    score += 1
                                }
                            }) {
                                HStack {
                                    Text("\(index + 1). \(quiz[currentQuestion].answers[index])")
                                        .font(.headline)
                                    Spacer()
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            } else {
                VStack {
                    Text("Quiz Complete!")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Your score: \(score) / \(quiz.count)")
                        .font(.title2)
                        .padding()
                    
                    Button(action: {
                        currentQuestion = 0
                        score = 0
                    }) {
                        Text("Restart Quiz")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Continue"),
                message: Text("Tap OK to continue to the next question."),
                dismissButton: .default(Text("OK")) {
                    showAlert = false
                    currentQuestion += 1
                }
            )
        }
    }
}

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: Int
}


