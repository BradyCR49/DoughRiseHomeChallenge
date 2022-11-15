//
//  AddCategoryView.swift
//  doughriseHome
//
//  Created by Brady Rhodes on 11/13/22.
//

import SwiftUI

struct AddCategoryView: View {
    @Environment(\.presentationMode)
    var presentationMode
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var formVM: CategoryFormViewModel
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Category Name", text: $formVM.name)
                TextField("Budget", value: $formVM.budget,format: .number)
                TextField("Spent", value: $formVM.spent, format: .number)
            }
            .navigationTitle("Add Category")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(
                        action: { presentationMode.wrappedValue.dismiss()},
                        label: {
                            Text("Cancel")
                        })
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(
                        action: {addCategory()},
                        label: {
                            Text("Save")
                        })
                }
            }
        }
        .navigationBarHidden(true)
    }
}
extension AddCategoryView {
    func addCategory(){
        let cat = Category(name: formVM.name, budget: formVM.budget, spent: formVM.spent)
        vm.addCategory(cat)
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView(formVM: CategoryFormViewModel())
            .environmentObject(ViewModel())
    }
}

