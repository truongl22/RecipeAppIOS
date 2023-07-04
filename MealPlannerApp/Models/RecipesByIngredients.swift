//
//  RecipesByIngredients.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/2/23.
//

import Foundation

/// A JSON Model when search Recipes by Ingredients
struct RecipesByIngredients: Codable{
    let id: Int
    let image: String
    let imageType: String
    let likes: Int
    let missedIngredientCount: Int
    let missedIngredients: [Ingredients]
    let title: String
    let unusedIngredients: [String]
    let usedIngredientCount: Int
    let usedIngredients: [Ingredients]
}


/// an Ingredients for missedIngredients array and usedIngredients array in RecipesByIngredients
struct Ingredients: Codable{
    let aisle: String
    let amount: Double
    let id: Int
    let image: String
    let meta: [String]
    let name: String
    let original: String
    let originalName: String
    let unit: String
    let unitLong: String
    let unitShort: String
}



