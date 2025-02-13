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
            
            // Display the Number
            Text("\(number)")
                .font(.system(size: 60, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
            
            // Prime / Not Prime Options
            Button(action: { checkAnswer(isPrime: true) }) {
                Text("Prime")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            
            Button(action: { checkAnswer(isPrime: false) }) {
                Text("Not Prime")
                    .font(.title)
                    .foregroundColor(.blue)
            }
    
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
