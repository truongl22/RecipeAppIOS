//
//  AddNewRecipeViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/28/23.
//

import UIKit

enum BrowseSectionTypeWorkout {
    case listWorkoutExercise(viewModels: [BuildPlanViewViewModel]) // 1
    case planWorkout(viewModels: [BuildPlanViewViewModel]) // 2
    case templates(viewModels: [BuildPlanViewViewModel]) // 3
    
    var title: String {
        switch self {
        case .listWorkoutExercise:
            return ""
        case .planWorkout:
            return "Plan Workout"
        case .templates:
            return "Templates"
        }
    }
}

class WorkoutViewController: UIViewController {
    
    private var workoutCollectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return WorkoutViewController.createSection(for: sectionIndex)
        }
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(FromYourRecipeCollectionViewCell.self, forCellWithReuseIdentifier: FromYourRecipeCollectionViewCell.identifier)
        collection.register(CuisineCollectionViewCell.self, forCellWithReuseIdentifier: CuisineCollectionViewCell.identifier)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.tintColor = .label
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private var sections = [BrowseSectionType]()
    
    private static func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection{
        switch sectionIndex {
        case 0:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0)
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(120)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        case 1:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 0)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.45),
                    heightDimension: .absolute(220)),
                subitems: [item]
            )
            //            let group = NSCollectionLayoutGroup.horizontal(
            //                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
            //                                                   heightDimension: .absolute(170)),
            //                subitem: item,
            //                count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        default:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(150)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Workout"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubViews(workoutCollectionView,spinner)
        view.backgroundColor = .white
        fetchRecipes()
//        workoutCollectionView.delegate = self
//        workoutCollectionView.dataSource = self
        setUpView()
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
//                    self?.sections.append(.cuisine(viewModels: (recipeModel?.results.compactMap({
//                        return BuildPlanViewViewModel(foodName: $0.title, foodImageURL: URL(string: $0.image))
//                    }))!))
                    self?.workoutCollectionView.reloadData()
                }
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
        //        section.append(.fromYourRecipe(viewModels: <#T##[BuildPlanViewViewModel]#>))
    }
    
    private func setUpView(){
        NSLayoutConstraint.activate([
            workoutCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            workoutCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            workoutCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            workoutCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc func pushToSearchScreen(){
//        let searchViewController = SearchViewController()
//        navigationController?.pushViewController(searchViewController, animated: true)
        
    }
}

//extension WorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        let type = sections[section]
////        switch type{
////        case .fromYourRecipe(let viewModels):
////            return 3
////        case .cuisine(let viewModels):
////            return viewModels.count
////        }
//    }
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
////        return sections.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let type = sections[indexPath.section]
//        switch type{
//        case .fromYourRecipe(let viewModels):
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FromYourRecipeCollectionViewCell.identifier, for: indexPath) as? FromYourRecipeCollectionViewCell else{
//                fatalError("Unsupported Cell")
//            }
//            //            let model = viewModels[indexPath.row]
//            //            cell.configure(with: model)
//            return cell
//        case .cuisine(let viewModels):
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CuisineCollectionViewCell.identifier, for: indexPath) as? CuisineCollectionViewCell else{
//                fatalError("Unsupported Cell")
//            }
//            let model = viewModels[indexPath.row]
////            cell.configure(with: model)
//            return cell
//        }
//    }
//}


