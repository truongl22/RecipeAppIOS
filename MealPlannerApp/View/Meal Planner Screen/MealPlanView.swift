//
//  MealPlanView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/24/23.
//

import UIKit

protocol MealPlanViewDelegate: AnyObject{
    func pushScreen(view: MealPlanView)
}

class MealPlanView: UIView {
    
    public weak var delegate: MealPlanViewDelegate?
    
    var todayMealPlanTableView: UITableView?
    
    private func createTodayMealPlanTableView() -> UITableView{
        let tableView = UITableView(frame: .zero, style: .grouped)
        //        tableView.register(InstructionHeaderView.self, forHeaderFooterViewReuseIdentifier: InstructionHeaderView.identifier)
        tableView.register(TodayMealPlanTableViewCell.self, forCellReuseIdentifier: TodayMealPlanTableViewCell.identifier)
        //        tableView.layoutMargins = UIEdgeInsets.zero
        //        tableView.separatorInset = UIEdgeInsets.zero
        tableView.rowHeight = 120
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
    
    private let plusFloatingButton = {
        let button = UIButton(type: .system)
        let plussign = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold))
        button.setImage(plussign, for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0.19, green: 0.52, blue: 0.42, alpha: 1.00)
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushToBuildPlanScreen), for: .touchUpInside)
        
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.4
  
        return button
    }()
    
    @objc func pushToBuildPlanScreen(){
        delegate?.pushScreen(view: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        let todayMealPlanTableView = createTodayMealPlanTableView()
        self.todayMealPlanTableView = todayMealPlanTableView
        todayMealPlanTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.addSubViews(todayMealPlanTableView, plusFloatingButton)
        //        recipeDetailViewViewModel.fetchRecipesInstructions()
        initConstraints()
        
    }
    
    private func initConstraints(){
        guard let todayMealPlanTableView = todayMealPlanTableView else{
            return
        }
        NSLayoutConstraint.activate([
            todayMealPlanTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            todayMealPlanTableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            todayMealPlanTableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            todayMealPlanTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            plusFloatingButton.widthAnchor.constraint(equalToConstant: 60),
            plusFloatingButton.heightAnchor.constraint(equalToConstant: 60),
            plusFloatingButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            plusFloatingButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
