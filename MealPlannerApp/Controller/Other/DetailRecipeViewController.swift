//
//  DetailRecipeViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/10/23.
//

import UIKit

enum Section {
    case main
}

/// a controller that show a detail recipe
class DetailRecipeViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<Section, RecipeInstructionViewViewModel>!
    private var snapshot: NSDiffableDataSourceSnapshot<Section, RecipeInstructionViewViewModel>!
    
    private var instructions: [RecipeInstructions] = []{
        didSet {
            var newInstructions: [RecipeInstructionViewViewModel] = []
            for i in instructions {
                let arrayStep = i.steps
                for j in arrayStep {
                    let model = RecipeInstructionViewViewModel(number: j.number, step: j.step)
                    newInstructions.append(model)
                }
            }
            numberOfInstructions = newInstructions
        }
    }
    
    public var numberOfInstructions: [RecipeInstructionViewViewModel] = []
    
    private var recipeInstructionsCollectionView: UICollectionView = {
        let layout = UICollectionLayoutListConfiguration(appearance: .grouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: layout)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: listLayout)
//        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, RecipeInstructionViewViewModel> { (cell, indexPath, item) in
        
        var content = cell.defaultContentConfiguration()
//        content. = item.number
        content.image = UIImage(systemName: "\(String(item.number)).square")
        content.text = item.step

        // Assign content configuration to cell
        cell.contentConfiguration = content
    }
    
    private var viewModel: BuildPlanViewViewModel
    
    init(viewModel: BuildPlanViewViewModel){
       
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(recipeInstructionsCollectionView)
        recipeInstructionsCollectionView.pin(to: view)
        recipeInstructionsCollectionView.delegate = self
        self.fetchRecipesInstructions()
        setupDataSource()
    }
    
    private func setupDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, RecipeInstructionViewViewModel>(collectionView: recipeInstructionsCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: RecipeInstructionViewViewModel) -> UICollectionViewCell? in
            
            // Dequeue reusable cell using cell registration (Reuse identifier no longer needed)
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellRegistration, for: indexPath, item: identifier)
            // Configure cell appearance
            cell.accessories = [.disclosureIndicator()]
            return cell
        }
    }
    
    private func setupSnapShot(){
        snapshot = NSDiffableDataSourceSnapshot<Section, RecipeInstructionViewViewModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(numberOfInstructions, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
 
    }
    
    public func fetchRecipesInstructions(){
        let id = viewModel.returnStringID()
        let query = URLQueryItem(name: "id", value: id)
        let request = Request(endpoint: Endpoint.analyzedInstructions, queryParameters: [query])
        
        Service.shared.execute(request, expecting: RecipeInstructions.self){ [weak self] result in
            switch result{
            case .success(let resultModel):
                self?.instructions = resultModel
                //                self?.onDataFetched?()
                DispatchQueue.main.async {
                    self?.setupSnapShot()
                    self?.recipeInstructionsCollectionView.reloadData()
                }
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension DetailRecipeViewController: UICollectionViewDelegate{
    
}
