//
//  RecipeInstructions.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/2/23.
//

import Foundation

struct RecipeInstructions: Codable{
    let name: String
    let steps: [StepArray]
}

struct StepArray: Codable{
    let number: Int
    let step: String
    let ingredients: [Ingre]
    let equipment: [EquipmentArray]
    
    init(number: Int, step: String, ingredients: [Ingre], equipment: [EquipmentArray]) {
        self.number = number
        self.step = step
        self.ingredients = ingredients
        self.equipment = equipment
    }
}

struct EquipmentArray: Codable{
    let id: Int
    let image: String
    let localizedName: String
    let name: String
  
}

struct Temp: Codable{
    let number: Double
    let unit: String
}

struct Ingre: Codable{
    let id: Int
    let name: String
    let localizedName: String
    let image: String
  
}

