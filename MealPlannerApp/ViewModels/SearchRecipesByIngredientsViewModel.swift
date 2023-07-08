//
//  SearchRecipesByIngredientsViewModel.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/4/23.
//

import Foundation
import UIKit

final class SearchRecipesByIngredientsViewModel: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    private var recipe: [RecipesByIngredients] = []{
        
    }
    private var recipeCellViewModel: [SearchRecipesCollectionViewCellViewModel] = []
    
    public func fetchRecipesByIngredients(){
        let query1 = URLQueryItem(name: "ingredients", value: "Apple")
        let query2 = URLQueryItem(name: "number", value: "2")
        let request = Request(endpoint: Endpoint.findByIngredients, queryParameters: [query1,query2])
        
        Service.shared.execute(request, expecting: RecipesByIngredients.self){ [weak self] result in
            switch result{
            case .success(let resultModel):
                print(String(describing: resultModel))
                self?.recipe = resultModel
                break
            case .failure(let error):
                print(String(describing: error))
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.identifier, for: indexPath) as? SearchResultCollectionViewCell else{
           fatalError("Unsupported Cell")
        }
        let model = SearchRecipesCollectionViewCellViewModel(foodName: "ngonn", foodImageURL: URL(string: "https://spoonacular.com/recipeImages/633547-312x231.jpg"))
        cell.configure(with: model)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
    
}
