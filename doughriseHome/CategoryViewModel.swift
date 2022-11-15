//
//  CategoryViewModel.swift
//  doughriseHome
//
//  Created by Brady Rhodes on 11/13/22.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var categories:[Category] = []
    @Published var totalBudget = 0.0
    
    init(){
        loadCategories()
    }
    func addCategory(_ cat: Category){
        categories.append(cat)
        }
    func loadCategories(){
        categories = Category.sampleData
    }
}

