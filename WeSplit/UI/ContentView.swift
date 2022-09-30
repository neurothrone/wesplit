//
//  ContentView.swift
//  WeSplit
//
//  Created by Zaid Neurothrone on 2022-09-30.
//

import SwiftUI

struct ContentView: View {
  @FocusState private var amountIsFocused: Bool
  
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 20
  
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var totalBill: Double {
    let tipSelection = Double(tipPercentage)
    let tipValue = checkAmount / 100 * tipSelection
    
    return checkAmount + tipValue
  }
  
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let amountPerPerson = totalBill / peopleCount
    
    return amountPerPerson
  }
  
  var localCurrency: FloatingPointFormatStyle<Double>.Currency {
    .currency(code: Locale.current.identifier)
  }
  
  var body: some View {
    NavigationStack {
      content
        .navigationTitle("WeSplit")
        .toolbar {
          ToolbarItemGroup(placement: .keyboard) {
            Spacer()
            
            Button("Done") {
              amountIsFocused = false
            }
          }
        }
    }
  }
  
  var content: some View {
    Form {
      Section {
        TextField(
          "Amount",
          value: $checkAmount,
          format: localCurrency
        )
        .keyboardType(.decimalPad)
        .focused($amountIsFocused)
      }
      
      NavigationLink {
        PeoplePickerScreen(numberOfPeople: $numberOfPeople)
      } label: {
        HStack {
          Text("Number of people")
          Spacer()
          Text((numberOfPeople + 2).description)
        }
      }
      
      Section {
        NavigationLink {
          TipPercentagePickerScreen(
            min: 0,
            max: 100,
            step: 5,
            percentage: $tipPercentage
          )
        } label: {
          HStack {
            Text("Tip percentage")
            Spacer()
            Text(tipPercentage, format: .percent)
          }
        }
      } header: {
        Text("How much tip do you want to leave?")
          .textCase(.none)
      }
      
      Section {
        Text(totalPerPerson, format: localCurrency)
      } header: {
        Text("Amount per person")
          .textCase(.none)
      }
      
      Section {
        Text(totalBill, format: localCurrency)
      } header: {
        Text("Total amount for the check")
          .textCase(.none)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
