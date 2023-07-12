//
//  FoodSearchViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/28/23.
//

import UIKit

class SearchViewController: UIViewController, SearchResultViewDelegate {
    
    ///  send recipe to detail screen
    func sendRecipeDetailToController(view: SearchResultView, selectedRecipe recipe: RecipesByIngredients) {
        let viewModel = RecipeDetailViewViewModel(detailedRecipe: recipe)
        let detailRecipeViewController = DetailRecipeViewController(viewModel: viewModel)
        navigationController?.pushViewController(detailRecipeViewController, animated: true)
    }
    
    
    private let searchResultView = SearchResultView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(searchResultView)
        setUpView()
    }
    
    private func setUpView(){
        searchResultView.pin(to: view)
        searchResultView.delegate = self
    }
    
    
}
