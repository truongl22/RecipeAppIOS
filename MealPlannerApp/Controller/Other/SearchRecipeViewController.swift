//
//  SearchRecipeViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/26/23.
//

import UIKit

class SearchRecipeViewController: UIViewController, UISearchResultsUpdating {
      
    private var recipe: RecipeModel!{
        didSet{
            for i in recipe.results{
                let model = SearchRecipesCollectionViewCellViewModel(foodName: i.title , foodImageURL:  URL(string: i.image))
                recipeCellViewModel.append(model)
            }
        }
    }
    
    private var recipeCellViewModel: [SearchRecipesCollectionViewCellViewModel] = []
    
    private let searchController: UISearchController = {
        let vc = UISearchController(searchResultsController: SearchResultsViewController())
        vc.searchBar.placeholder = "Put any recipe that you like:)"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()
    
    private let recipeSearchResultCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isHidden = false
//        collection.alpha = 0
        collection.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        view.addSubViews(recipeSearchResultCollectionView)
        recipeSearchResultCollectionView.pin(to: view)
        recipeSearchResultCollectionView.dataSource = self
        recipeSearchResultCollectionView.delegate = self
        fetchRecipes()
    }
     
    public func fetchRecipes(){
        let query1 = URLQueryItem(name: "cuisine", value: "Vietnamese")
        let request = Request(endpoint: Endpoint.complexSearch, queryParameters: [query1])

        Service.shared.executeDictionary(request, expecting: RecipeModel.self){ [weak self] result in
            switch result{
            case .success(let resultModel):
                self?.recipe = resultModel
                DispatchQueue.main.async {
                    self?.recipeSearchResultCollectionView.reloadData()
                }
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let resultsController = searchController.searchResultsController as? SearchResultsViewController,
              let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        print(query)
    }
}

extension SearchRecipeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
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
        let recipe = recipe.results[indexPath.row]
        let viewModel = RecipeDetailViewViewModel(detailedRecipe: recipe)
        let detailRecipeViewController = DetailRecipeViewController(viewModel: viewModel)
        detailRecipeViewController.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailRecipeViewController, animated: true)
    }
}
