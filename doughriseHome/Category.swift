//
//  Category.swift
//  doughriseHome
//
//  Created by Brady Rhodes on 11/12/22.
//

import SwiftUI

struct Category: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var budget: Double
    var spent: Double
    
    static var sampleData: [Category] = [
    Category(name: "Rent", budget: 900, spent: 400),
    Category(name: "Food", budget: 500, spent: 250),
    Category(name: "School Funds", budget: 300, spent: 200)
    ]
}
