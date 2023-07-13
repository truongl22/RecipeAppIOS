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
    
    public func fetchRecipesInstructions(){
        let id = String(detailedRecipe.id)
        let query = URLQueryItem(name: "id", value: id)
        let request = Request(endpoint: Endpoint.analyzedInstructions, queryParameters: [query])

        Service.shared.execute(request, expecting: RecipeInstructions.self){ [weak self] result in
            switch result{
            case .success(let resultModel):
                print(String(describing: resultModel))
            case .failure(let error):
                print(String(describing: error))
            }

        }
    }
    
    
}
