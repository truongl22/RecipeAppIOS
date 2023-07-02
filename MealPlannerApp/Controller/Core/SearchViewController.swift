//
//  FoodSearchViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/28/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    //    private let searchView = SearchView()
    
    private let tableViewSearchResult: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchView = SearchView(frame: CGRect(x: 50, y: 100, width: 200, height: 100))
        view.addSubview(searchView)
        tableViewSearchResult.delegate = self
        tableViewSearchResult.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableViewSearchResult.frame = view.frame
    }
    
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier , for: indexPath) as! SearchResultTableViewCell
        cell.textLabel?.text = "aaaaa"
        return cell
    }
    
    
}
