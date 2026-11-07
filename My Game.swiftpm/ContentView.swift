import SwiftUI

struct ContentView: View {
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    @State private var bmi: Double = 0
    @State private var bmiCat: String = ""
    var body: some View {
        VStack {
            Text("Finding BMI")
                .foregroundColor(.blue)
            TextField("Please enter weight in kg:", text: $weightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Please enter height in m:", text: $heightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Calculate BMI") {
                var weightDouble: Double
                var heightDouble: Double
                weightDouble = Double(weightText) ?? 0
                heightDouble = Double(heightText) ?? 0
                bmi = weightDouble / (heightDouble*heightDouble)
                if bmi < 18.5 {bmiCat = " Underweight😔"}
                if bmi > 18.5 && bmi < 23 {bmiCat = " Normal🙂"}
                if bmi >= 23 && bmi < 25 {bmiCat = " Overweight54😟"}
                if bmi > 25 {bmiCat = " Obese🚑"}
            }
            Text("Your BMI is \(bmi, specifier:"%.1f")")
            Text("You are" + bmiCat)
                .rotation3DEffect(.degrees (45), axis: (x: 0, y: 0, z: 0))
        }
    }
}
