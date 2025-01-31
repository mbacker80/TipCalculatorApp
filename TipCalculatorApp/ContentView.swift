//
//  ContentView.swift
//  TipCalculatorApp
//
//  Created by James Jolly on 1/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount: Double = 0.0;
    @State private var tipPercentage: Double = 0.0;
    @State private var numberOfPeople: Double = 0;
    @State private var showResults: Bool = false;
    
    var tipAmount: Double {
        return billAmount * tipPercentage / 100
    }
    var totalAmount: Double {
        return billAmount + tipAmount
    }
    var amountPerPerson: Double {
        return totalAmount / Double(numberOfPeople)
    }
    
    var body: some View {
        VStack {
            
            // Title Text View
            Text("Modern Tip Calculator")
                .padding()
            Text("Tip Calculator")
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            VStack{
                Text("Bill Amount")
                Text("\(billAmount, format: .currency(code: "USD"))")
                    .foregroundStyle(Color.purple)
                Slider(value: $billAmount, in: 0...500, step: 1)
                    .padding()
                    
            }
            VStack{
                
                Text("Tip Percentage")
                Text("\(Int(tipPercentage))%")
                    .foregroundStyle(Color.green)
                Slider(value: $tipPercentage, in: 0...30, step: 1)
                    .padding()
            }
            VStack{
                
                Text("Number of People")
                Text("Number of People: \(Int(numberOfPeople))")
                    .foregroundStyle(Color.orange)
                Slider(value: $numberOfPeople, in: 0...20, step: 1)
                    .padding()
            }
            
            Button(action: {showResults.toggle()}) {
                Text(showResults ? "Hide Results" : "Calculate")
                    .background(showResults ? Color.red : Color.blue)
                    .foregroundStyle(.white)
                    .padding()
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
            }
            .padding()
            
            if showResults {
                VStack {
                    Text("Tip Amount: \(tipAmount, format: .currency(code: "USD"))")
                    Text("Total Amount: \(totalAmount, format: .currency(code: "USD"))")
                    Text("Amount Per Person: \(amountPerPerson, format: .currency(code: "USD"))")
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
                //.padding([.leading, .trailing], 20)
                
            }
            else
            {
                
                Spacer()
                Spacer()
            }
            
            
        }
        .padding()
    }
}
#Preview {
    ContentView()
}


