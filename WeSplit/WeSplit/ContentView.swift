//
//  ContentView.swift
//  WeSplit
//
//  Created by Özkan Adar on 02/03/2020.
//  Copyright © 2020 Özkan Adar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
   
    var totalPerPerson: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = Double(orderAmount) + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    var body: some View {
        NavigationView {
        Form {
            
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0)")
                    }
                }
                
                //Need to fix this calculation later. Up above!
            }
            Section(header:  Text("How much tip do you want to leave?")) {
               
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Amount per person")) {
                Text("\(totalPerPerson, specifier: "%.2f")")
            }
            
           
        }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
