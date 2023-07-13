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
        title = viewModel.title
//        viewModel.fetchRecipesInstructions()
        view.addSubview(recipeDetailView)
        recipeDetailView.recipeInstructionTableView?.delegate = self
        recipeDetailView.recipeInstructionTableView?.dataSource = self
        setUpView()
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InstructionTableViewCell.identifier, for: indexPath) as? InstructionTableViewCell else{
            fatalError("Unsupported Cell")
        }
//        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
}
