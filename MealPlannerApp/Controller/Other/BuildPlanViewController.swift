//
//  MealPlannerViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/12/23.
//

import UIKit

enum BrowseSectionType {
    case fromYourRecipe(viewModels: [BuildPlanViewViewModel]) // 1
    case cuisine(viewModels: [BuildPlanViewViewModel])// 2
    
    var title: String {
        switch self {
        case .fromYourRecipe:
            return "From Your Recipe"
        case .cuisine:
            return "Cuisine"
        }
    }
}

class BuildPlanViewController: UIViewController {
    
    private var sections = [BrowseSectionType]()
    
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
        fetchRecipes()
        buildPlanCollectionView.delegate = self
        buildPlanCollectionView.dataSource = self
        setupRightBarButton()
    }
    
    public func fetchRecipes(){
        var recipeModel: RecipeModel?
        let query1 = URLQueryItem(name: "cuisine", value: "Vietnamese")
        let request = Request(endpoint: Endpoint.complexSearch, queryParameters: [query1])
        
        Service.shared.executeDictionary(request, expecting: RecipeModel.self){ [weak self] result in
            switch result{
            case .success(let resultModel):
                recipeModel = resultModel
                DispatchQueue.main.async {
                    self?.sections.append(.fromYourRecipe(viewModels: (recipeModel?.results.compactMap({
                        return BuildPlanViewViewModel(foodName: $0.title, foodImageURL: URL(string: $0.image), id: $0.id)
                    }))!))
                    self?.sections.append(.cuisine(viewModels: (recipeModel?.results.compactMap({
                        return BuildPlanViewViewModel(foodName: $0.title, foodImageURL: URL(string: $0.image), id: $0.id)
                    }))!))
                    self?.buildPlanCollectionView.reloadData()
                }
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
        //        section.append(.fromYourRecipe(viewModels: <#T##[BuildPlanViewViewModel]#>))
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

extension BuildPlanViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type{
        case .fromYourRecipe(let viewModels):
            return 4
        case .cuisine(let viewModels):
            return viewModels.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = sections[indexPath.section]
        switch type{
        case .fromYourRecipe(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FromYourRecipeCollectionViewCell.identifier, for: indexPath) as? FromYourRecipeCollectionViewCell else{
                fatalError("Unsupported Cell")
            }
            //            let model = viewModels[indexPath.row]
            //            cell.configure(with: model)
            return cell
        case .cuisine(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CuisineCollectionViewCell.identifier, for: indexPath) as? CuisineCollectionViewCell else{
                fatalError("Unsupported Cell")
            }
            let model = viewModels[indexPath.row]
            cell.configure(with: model)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type = sections[indexPath.section]
        switch type{
        case .fromYourRecipe(let viewModels): break
            
        case .cuisine(viewModels: let viewModels):
            collectionView.deselectItem(at: indexPath, animated: true)
            let recipe = viewModels[indexPath.row]
            //        delegate?.selectedRecipe(recipe: recipe)
            //
            //
            //            let viewModel = RecipeDetailViewViewModel(detailedRecipe: recipe)
            //            let detailRecipeViewController = DetailRecipeViewController(viewModel: viewModel)
            //            detailRecipeViewController.navigationItem.largeTitleDisplayMode = .never
            //            navigationController?.pushViewController(detailRecipeViewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderCollectionReusableView.identifier,
            for: indexPath
        ) as? HeaderCollectionReusableView, kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let section = indexPath.section
        let title = sections[section].title
        header.configure(with: title)
        return header
    }
    
    private static func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection{
        let supplementaryViews = [
            NSCollectionLayoutBoundarySupplementaryItem( layoutSize: NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(50)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        switch sectionIndex {
        case 0:
            let item = NSCollectionLayoutItem( layoutSize: NSCollectionLayoutSize( widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(120)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = supplementaryViews
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
            return section
        case 1:
            let item = NSCollectionLayoutItem( layoutSize: NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0),
                                                                                   heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.45),
                    heightDimension: .absolute(220)),
                subitems: [item]
            )
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
            section.boundarySupplementaryItems = supplementaryViews
            return section
        default:
            let item = NSCollectionLayoutItem( layoutSize: NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0),
                                                                                   heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(150)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = supplementaryViews
            return section
        }
    }
}


