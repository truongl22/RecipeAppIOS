//
//  RecipeModel.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/25/23.
//

import Foundation

struct RecipeModel: Codable {
    let results: [ResultRecipeArray]
    let offset: Int
    let number: Int
    let totalResults: Int
    
    init(results: [ResultRecipeArray], offset: Int, number: Int, totalResults: Int) {
        self.results = results
        self.offset = offset
        self.number = number
        self.totalResults = totalResults
    }
}

struct ResultRecipeArray: Codable{
    let id: Int
    let title: String
    let image: String
    let imageType: String
    
    init(id: Int, title: String, image: String, imageType: String) {
        self.id = id
        self.title = title
        self.image = image
        self.imageType = imageType
    }
}
