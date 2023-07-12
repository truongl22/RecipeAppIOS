//
//  RecipeDetailViewViewModel.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/10/23.
//

import Foundation

final class RecipeDetailViewViewModel{
    private let detailedRecipe: RecipesByIngredients
    
    init(detailedRecipe: RecipesByIngredients){
        self.detailedRecipe = detailedRecipe
    }
    
    public var title: String{
        detailedRecipe.title.uppercased()
    }
}
