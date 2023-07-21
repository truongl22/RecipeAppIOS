//
//  DetailRecipeViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/10/23.
//

import UIKit

/// a controller that show a detail recipe
class DetailRecipeViewController: UIViewController {
    private let viewModel: RecipeDetailViewViewModel
    private var cellHeights: [IndexPath: CGFloat] = [:]
    private let recipeDetailView = RecipeDetaiView()
    
    init(viewModel: RecipeDetailViewViewModel){
       
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(recipeDetailView)
        setUpView()
        
        recipeDetailView.recipeInstructionTableView?.delegate = self
        recipeDetailView.recipeInstructionTableView?.dataSource = self
        viewModel.delegate = self
        viewModel.fetchRecipesInstructions()
        

//        viewModel.onDataFetched = { [weak self] in
//            DispatchQueue.main.async {
//                self?.recipeDetailView.recipeInstructionTableView?.reloadData()
//            }
//        }
        
        
    }
    
    
    private func setUpView(){
        NSLayoutConstraint.activate([
            recipeDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            recipeDetailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            recipeDetailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            recipeDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension DetailRecipeViewController:  UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("ccccc \(viewModel.numberOfIns())")
        print("dddddd \(viewModel.numberOfInstructions.count)")

        return viewModel.numberOfInstructions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InstructionTableViewCell.identifier, for: indexPath) as? InstructionTableViewCell else{
            fatalError("Unsupported Cell")
        }
        let model = viewModel.numberOfInstructions[indexPath.row]
        cell.configure(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: InstructionHeaderView.identifier) as! InstructionHeaderView
        let headerView = InstructionHeaderView(frame: CGRect(x: 0, y: 0, width: recipeDetailView.bounds.width, height: 450))
        //        recipeInstructionTableView.tableHeaderView = headerView
        //
        headerView.configure(with: viewModel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 450 : 0
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 150 // Provide an estimated row height for better performance
//    }
    
}

extension DetailRecipeViewController:  RecipeDetailViewViewModelProtocol{
    func didLoad() {
        recipeDetailView.recipeInstructionTableView!.reloadData()
    }
}

