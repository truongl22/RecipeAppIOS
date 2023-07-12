//
//  SearchRecipesByIngredientsViewModel.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/4/23.
//

import Foundation
import UIKit

protocol SearchRecipesByIngredientsViewModelProtocol: AnyObject{
    func didLoad()
    func selectedRecipe(recipe: RecipesByIngredients)
}

final class SearchRecipesByIngredientsViewModel: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    public weak var delegate: SearchRecipesByIngredientsViewModelProtocol?
    
    
    private var recipe: [RecipesByIngredients] = []{
        didSet{
            for i in recipe{
                let model = SearchRecipesCollectionViewCellViewModel(foodName: i.title , foodImageURL:  URL(string: i.image))
                recipeCellViewModel.append(model)
            }
        }
    }
    private var recipeCellViewModel: [SearchRecipesCollectionViewCellViewModel] = []
    
    public func fetchRecipesByIngredients(){
        let query1 = URLQueryItem(name: "ingredients", value: "egg")
        let query2 = URLQueryItem(name: "number", value: "50")
        let request = Request(endpoint: Endpoint.findByIngredients, queryParameters: [query1,query2])
        
        Service.shared.execute(request, expecting: RecipesByIngredients.self){ [weak self] result in
            switch result{
            case .success(let resultModel):
                self?.recipe = resultModel
                DispatchQueue.main.async {
                    self?.delegate?.didLoad()
                }
                break
            case .failure(let error):
                print(String(describing: error))
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeCellViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.identifier, for: indexPath) as? SearchResultCollectionViewCell else{
           fatalError("Unsupported Cell")
        }
        let model = recipeCellViewModel[indexPath.row]
        cell.configure(with: model)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(
            width: width,
            height: width * 1.25
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let recipe = recipe[indexPath.row]
        delegate?.selectedRecipe(recipe: recipe)
    }
    
}
