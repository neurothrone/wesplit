//
//  TipPercentagePickerScreen.swift
//  WeSplit
//
//  Created by Zaid Neurothrone on 2022-09-30.
//

import SwiftUI

struct TipPercentagePickerScreen: View {
  @Binding var percentage: Int
  
  let min: Int
  let max: Int
  let step: Int
  
  let percentages: [Int]
  
  init(min: Int, max: Int, step: Int, percentage: Binding<Int>) {
    self.min = min
    self.max = max
    self.step = step
    _percentage = percentage
    percentages = Array(stride(from: min, to: max + 1, by: step))
  }
  
  var body: some View {
    List {
      Picker("Tip percentage", selection: $percentage) {
        ForEach(percentages, id: \.self) {
          Text($0, format: .percent)
        }
      }
      .pickerStyle(.inline)
    }
    .navigationTitle("Tip percentage")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct TipPercentagePickerScreen_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      TipPercentagePickerScreen(min: 0, max: 25, step: 5, percentage: .constant(20))
    }
  }
}
