//
//  ContentView.swift
//  Lab1_berlean_gregori
//
//  Created by Berlean Gregori on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
    @State private var number: Int = Int.random(in: 1...100)
    @State private var isCorrect: Bool? = nil
    @State private var correctCount: Int = 0
    @State private var wrongCount: Int = 0
    @State private var attempts: Int = 0
    @State private var timer: Timer? = nil
    
    
    var body: some View {
        VStack {
            Spacer()

            // Display the Random Number
            Text("\(number)")
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
            
            // Prime / Not Prime Options buttons
            Button(action: { checkAnswer(isPrime: true) }) {
                Text("Prime")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding()
                    .frame(width: 175, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2))
            }
            
            // Not Prime button
            Button(action: { checkAnswer(isPrime: false) }) {
                Text("Not Prime")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                    .frame(width: 175, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red, lineWidth: 2))
            }
            
            // Display Correct or Incorrect Icon
            if let isCorrect = isCorrect {
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(isCorrect ? .green : .red)
                    .padding()
            }
            
            // Score Counter
            HStack {
                Text("Correct: \(correctCount)")
                    .foregroundColor(.green)
                Spacer()
                Text("Wrong: \(wrongCount)")
                    .foregroundColor(.red)
                }
                .padding(.horizontal)
                        
                Spacer()
        }
        .onAppear {
            startTimer()
        }
        .alert(isPresented: .constant(attempts > 0 && attempts % 10 == 0)) {
            Alert(title: Text("Score Summary"),
                message: Text("Correct: \(correctCount)\nWrong: \(wrongCount)"),
                dismissButton: .default(Text("OK")))
        }
    }
    // Timer to Change Number Every 5 Seconds
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            wrongCount += 1
            attempts += 1
            resetGame()
        }
    }
    
    // Helper function to Check if a Number is Prime
    func isPrime(_ num: Int) -> Bool {
        if num < 2 { return false }
        for i in 2..<num {
            if num % i == 0 { return false }
        }
        return true
    }
    
    // Function to Check Answer and Update Score
    func checkAnswer(isPrime: Bool) {
        let correct = (isPrime == self.isPrime(number))
        isCorrect = correct
            
        if correct {
            correctCount += 1
        } else {
            wrongCount += 1
        }
        
        attempts += 1
        resetGame()
    }
    
    // Function to Reset the Game with a New Number
    func resetGame() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            number = Int.random(in: 1...100)
            isCorrect = nil
        }
    }
    
}

#Preview {
    ContentView()
}
