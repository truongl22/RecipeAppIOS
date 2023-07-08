//
//  FoodSearchViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/28/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchResultView = SearchResultView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(searchResultView)
        NSLayoutConstraint.activate([
            searchResultView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchResultView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            searchResultView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchResultView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])

     
    }
    
    
}
