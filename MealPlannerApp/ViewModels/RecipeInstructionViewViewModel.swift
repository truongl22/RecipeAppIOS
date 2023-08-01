//
//  RecipeInstructionViewViewModel.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/28/23.
//

import Foundation

struct RecipeInstructionViewViewModel: Hashable{
    let number: Int
    let step: String
    
    init(number: Int, step: String) {
        self.number = number
        self.step = step
    }
   
}
