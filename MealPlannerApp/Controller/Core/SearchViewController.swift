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
        detailRecipeViewController.navigationItem.largeTitleDisplayMode = .never
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
        NSLayoutConstraint.activate([
            searchResultView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchResultView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchResultView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchResultView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        searchResultView.delegate = self
    }
    
    
}
