//
//  SearchView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/29/23.
//

import UIKit

/// a class that handle showing list of recipe
final class SearchResultView: UIView {
    private let searchRecipesByIngrdeintsViewModel = SearchRecipesByIngredientsViewModel()

//    private let recipeSearchBar: UISearchBar = {
//        let searchBar = UISearchBar()
//        searchBar.placeholder = "Search names.."
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        return searchBar
//    }()
    
    private let recipeInCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
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
   
    }
    
    private func initConstraints(){
        recipeInCollectionView.pin(to: self)
//        NSLayoutConstraint.activate([
//            recipeInCollectionView.topAnchor.constraint(equalTo: topAnchor),
//            recipeInCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            recipeInCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
//            recipeInCollectionView.rightAnchor.constraint(equalTo: rightAnchor)
//        ])
    }
    
    private func setUprecipeInCollectionView(){
        recipeInCollectionView.dataSource = searchRecipesByIngrdeintsViewModel
        recipeInCollectionView.delegate = searchRecipesByIngrdeintsViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
