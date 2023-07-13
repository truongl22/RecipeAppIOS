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
    
    private func createrecipeInstructionTableView() -> UITableView{
        let tableView = UITableView()
        tableView.register(InstructionTableViewCell.self, forCellReuseIdentifier: InstructionTableViewCell.identifier)
        //        tableView.layoutMargins = UIEdgeInsets.zero
        //        tableView.separatorInset = UIEdgeInsets.zero
        tableView.rowHeight = 36
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        let recipeInstructionTableView = createrecipeInstructionTableView()
        self.recipeInstructionTableView = recipeInstructionTableView
        self.addSubViews(recipeInstructionTableView)
        
        let headerView = InstructionHeaderView()
        recipeInstructionTableView.addSubview(headerView)


        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: recipeInstructionTableView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: recipeInstructionTableView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: recipeInstructionTableView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100)

        ])
        recipeInstructionTableView.tableHeaderView = headerView
        
        initConstraints()
    }
    
    private func initConstraints(){
        guard let recipeInstructionTableView = recipeInstructionTableView else{
            return
        }
//        recipeInstructionTableView.pin(to: self)
        
        NSLayoutConstraint.activate([
            recipeInstructionTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 120),
            recipeInstructionTableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            recipeInstructionTableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            recipeInstructionTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
   
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //    public configure(with viewModel: )
    
    
    
}
