//
//  SearchView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/29/23.
//

import UIKit

protocol SearchResultViewDelegate: AnyObject{
    func sendRecipeDetailToController(view: SearchResultView, selectedRecipe recipe: RecipesByIngredients)
    
}

/// a class that handle showing list of recipe
final class SearchResultView: UIView {
    public weak var delegate: SearchResultViewDelegate?
    
    private let searchRecipesByIngrdeintsViewModel = SearchRecipesByIngredientsViewModel()

//    private let recipeSearchBar: UISearchBar = {
//        let searchBar = UISearchBar()
//        searchBar.placeholder = "Search names.."
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        return searchBar
//    }()
    
    private let recipeInCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isHidden = false
//        collection.alpha = 0
        collection.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground
        self.addSubview(recipeInCollectionView)
        setUprecipeInCollectionView()
        initConstraints()
        searchRecipesByIngrdeintsViewModel.delegate = self
//        searchRecipesByIngrdeintsViewModel.fetchRecipesByIngredients()
    }
    
    private func initConstraints(){
        recipeInCollectionView.pin(to: self)
    }
    
    private func setUprecipeInCollectionView(){
        recipeInCollectionView.dataSource = searchRecipesByIngrdeintsViewModel
        recipeInCollectionView.delegate = searchRecipesByIngrdeintsViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchResultView:  SearchRecipesByIngredientsViewModelProtocol{
    func selectedRecipe(recipe: RecipesByIngredients) {
        delegate?.sendRecipeDetailToController(view: self, selectedRecipe: recipe)
    }
    
    func didLoad() {
        recipeInCollectionView.reloadData()
    }
    
    
}
