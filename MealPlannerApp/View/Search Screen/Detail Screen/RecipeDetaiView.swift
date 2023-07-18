//
//  RecipeDetaiView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/10/23.
//

import UIKit

/// View respresent a detail recipe
class RecipeDetaiView: UIView {
    
    var recipeInstructionTableView: UITableView?
    private var recipeDetailViewViewModel: RecipeDetailViewViewModel
    
    
    private func createrecipeInstructionTableView() -> UITableView{
        let tableView = UITableView(frame: .zero, style: .grouped)
//        tableView.register(InstructionHeaderView.self, forHeaderFooterViewReuseIdentifier: InstructionHeaderView.identifier)
        tableView.register(InstructionTableViewCell.self, forCellReuseIdentifier: InstructionTableViewCell.identifier)
        //        tableView.layoutMargins = UIEdgeInsets.zero
        //        tableView.separatorInset = UIEdgeInsets.zero
        
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
    
    init(frame: CGRect, recipeDetailViewViewModel: RecipeDetailViewViewModel) {
        self.recipeDetailViewViewModel = recipeDetailViewViewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        let recipeInstructionTableView = createrecipeInstructionTableView()
        self.recipeInstructionTableView = recipeInstructionTableView
        self.addSubViews(recipeInstructionTableView)
        recipeDetailViewViewModel.fetchRecipesInstructions()
        initConstraints()
    
        
    }
    
    private func initConstraints(){
        guard let recipeInstructionTableView = recipeInstructionTableView else{
            return
        }
        NSLayoutConstraint.activate([
            recipeInstructionTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            recipeInstructionTableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            recipeInstructionTableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            recipeInstructionTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
   
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    
    
    
}

extension RecipeDetaiView:  RecipeDetailViewViewModelProtocol{
    func didLoad() {
        recipeInstructionTableView!.reloadData()
    }
}
