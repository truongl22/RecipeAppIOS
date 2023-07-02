//
//  SearchView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/29/23.
//

import UIKit

class SearchView: UIView {
    
    private let recipeSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search names.."
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
//    private let tableViewSearchResult: UITableView = {
//        let tableView = UITableView()
//        tableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        self.addSubview(recipeSearchBar)
//        self.addSubview(tableViewSearchResult)
        
    }
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            recipeSearchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            recipeSearchBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            recipeSearchBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            
//            tableViewSearchResult.topAnchor.constraint(equalTo: recipeSearchBar.bottomAnchor, constant: 8),
//            tableViewSearchResult.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
//            tableViewSearchResult.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
//            tableViewSearchResult.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
