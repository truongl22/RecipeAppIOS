//
//  MealPlannerViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/12/23.
//

import UIKit

enum BrowseSectionType {
    case fromYourRecipe(viewModels: [BuildPlanViewViewModel]) // 0
    case cuisine(viewModels: [BuildPlanViewViewModel])// 1
    case breakfast(viewModels: [BuildPlanViewViewModel])// 2
    case maincourse(viewModels: [BuildPlanViewViewModel])// 3
    case dessert(viewModels: [BuildPlanViewViewModel])// 4
    
    var title: String {
        switch self {
        case .fromYourRecipe:
            return "From Your Recipe"
        case .cuisine:
            return "Cuisine"
        case .breakfast:
            return "Breakfast"
        case .maincourse:
            return "Maincourse"
        case .dessert:
            return "Dessert"
        }
    }
}

class BuildPlanViewController: UIViewController {
    
    internal var sections = [BrowseSectionType]()
    
    private var buildPlanCollectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return BuildPlanViewController.createSection(for: sectionIndex)
        }
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(FromYourRecipeCollectionViewCell.self, forCellWithReuseIdentifier: FromYourRecipeCollectionViewCell.identifier)
        collection.register(CuisineCollectionViewCell.self, forCellWithReuseIdentifier: CuisineCollectionViewCell.identifier)
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.tintColor = .label
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Build Your Plan"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubViews(buildPlanCollectionView,spinner)
        buildPlanCollectionView.pin(to: view)
        view.backgroundColor = .white
        fetchAllRecipes()
//        fetchRecipes()
//        fetchRecipesBreakfast()
        buildPlanCollectionView.delegate = self
        buildPlanCollectionView.dataSource = self
        setupRightBarButton()
    }
    
    public func fetchAllRecipes(){
        let group = DispatchGroup()
        group.enter()
        group.enter()
        group.enter()
        group.enter()
        
        var recipeModelCuisine: RecipeModel?
        var recipeModelBreakfast: RecipeModel?
        var recipeModelMainCourse: RecipeModel?
        var recipeModelDessert: RecipeModel?
        
        let requestCuisine = Request(endpoint: Endpoint.complexSearch, queryParameters: [URLQueryItem(name: "cuisine", value: "Vietnamese")])
        let requestBreakfast = Request(endpoint: Endpoint.complexSearch, queryParameters: [URLQueryItem(name: "type", value: "breakfast")])
        let requestMainCourse = Request(endpoint: Endpoint.complexSearch, queryParameters: [URLQueryItem(name: "type", value: "maincourse")])
        let requestDessert = Request(endpoint: Endpoint.complexSearch, queryParameters: [URLQueryItem(name: "type", value: "dessert")])
        
        Service.shared.executeDictionary(requestCuisine, expecting: RecipeModel.self){ [weak self] result in
            defer { group.leave()}
            switch result{
            case .success(let resultModel):
                recipeModelCuisine = resultModel
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
        Service.shared.executeDictionary(requestBreakfast, expecting: RecipeModel.self){ [weak self] result in
            defer { group.leave()}
            switch result{
            case .success(let resultModel):
                recipeModelBreakfast = resultModel
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
        Service.shared.executeDictionary(requestMainCourse, expecting: RecipeModel.self){ [weak self] result in
            defer { group.leave()}
            switch result{
            case .success(let resultModel):
                recipeModelMainCourse = resultModel
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
        Service.shared.executeDictionary(requestDessert, expecting: RecipeModel.self){ [weak self] result in
            defer { group.leave()}
            switch result{
            case .success(let resultModel):
                recipeModelDessert = resultModel
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
        group.notify(queue: .main) {
            guard let rec = recipeModelCuisine, let cuisine = recipeModelCuisine, let breakfast = recipeModelBreakfast,
            let maincourse = recipeModelMainCourse, let dessert = recipeModelDessert else {
                fatalError("Models are nil")
            }
            self.configureModels( rec: rec, cuisine: cuisine, breakfast: breakfast, maincourse: maincourse, dessert: dessert)
        }
    }
    
    private func configureModels(rec: RecipeModel, cuisine: RecipeModel, breakfast: RecipeModel, maincourse: RecipeModel, dessert: RecipeModel){
        sections.append(.fromYourRecipe(viewModels: (rec.results.compactMap({
            return BuildPlanViewViewModel(foodName: $0.title, foodImageURL: URL(string: $0.image), id: $0.id)
        }))))
        sections.append(.cuisine(viewModels: (cuisine.results.compactMap({
            return BuildPlanViewViewModel(foodName: $0.title, foodImageURL: URL(string: $0.image), id: $0.id)
        }))))
        sections.append(.breakfast(viewModels: (breakfast.results.compactMap({
            return BuildPlanViewViewModel(foodName: $0.title, foodImageURL: URL(string: $0.image), id: $0.id)
        }))))
        sections.append(.maincourse(viewModels: (maincourse.results.compactMap({
            return BuildPlanViewViewModel(foodName: $0.title, foodImageURL: URL(string: $0.image), id: $0.id)
        }))))
        sections.append(.dessert(viewModels: (dessert.results.compactMap({
            return BuildPlanViewViewModel(foodName: $0.title, foodImageURL: URL(string: $0.image), id: $0.id)
        }))))
        buildPlanCollectionView.reloadData()
    }
    
    func setupRightBarButton(){
        let searchIcon = UIBarButtonItem( image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self,
                                          action: #selector(pushToSearchScreen))
        navigationItem.rightBarButtonItems = [searchIcon]
    }
    
    @objc func pushToSearchScreen(){
        let searchRecipeViewController = SearchRecipeViewController()
        navigationController?.pushViewController(searchRecipeViewController, animated: true)
    }
}
