//
//  IntakeSummaryView.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 11/04/22.
//

import SwiftUI

struct IntakeSummaryView: View {
    
    @Binding var isShowingIntakeSummarySheet: Bool
    
    private let viewModel = IntakeSummaryViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Summary")) {
                    UITableViewCellDefault(title: "Meal Eaten", subtitle: "\(viewModel.mealCount)")
                }
                
                Section(header: Text("Macros")) {
                    UITableViewCellDefault(title: "Calories", subtitle: "\(viewModel.calories) kCal")
                    UITableViewCellDefault(title: "Carbs", subtitle: "\(viewModel.carbs) gr")
                    UITableViewCellDefault(title: "Fat", subtitle: "\(viewModel.fat) gr")
                    UITableViewCellDefault(title: "Protein", subtitle: "\(viewModel.protein) gr")
                }
            }.listStyle(.grouped)
            .navigationTitle("Intake Summary")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        isShowingIntakeSummarySheet.toggle()
                    }
                }
            }
        }
    }
}

struct IntakeSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        IntakeSummaryView(isShowingIntakeSummarySheet: .constant(true))
    }
}
