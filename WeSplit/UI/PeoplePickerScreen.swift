//
//  PeoplePickerScreen.swift
//  WeSplit
//
//  Created by Zaid Neurothrone on 2022-09-30.
//

import SwiftUI

struct PeoplePickerScreen: View {
  @Binding var numberOfPeople: Int
  
  var body: some View {
    List {
      Picker("Number of people", selection: $numberOfPeople) {
        ForEach(2 ..< 11) {
          Text("\($0) people")
        }
      }
      .pickerStyle(.inline)
    }
    .navigationTitle("Number of people")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct PeoplePickerScreen_Previews: PreviewProvider {
  static var previews: some View {
    PeoplePickerScreen(numberOfPeople: .constant(2))
  }
}
