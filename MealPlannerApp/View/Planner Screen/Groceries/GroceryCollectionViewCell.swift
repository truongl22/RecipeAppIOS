//
//  GroceryCollectionViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/11/23.
//

import UIKit

class GroceryCollectionViewCell: UICollectionViewCell {
    private let workOutManager = WorkOutManager()
    
    static let identifier = "GroceryCollectionViewCell"
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var groceriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "Groceries"
        label.textColor = UIColor(red: 0.00, green: 0.12, blue: 0.17, alpha: 1.00)
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Tuesday, Jul 11"
        label.textColor = .gray
        return label
    }()
    
    private var groceriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TodayWorkOutTableViewCell.self, forCellReuseIdentifier: TodayWorkOutTableViewCell.identifier)
        tableView.register(WorkoutHeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
//        tableView.backgroundColor = .green
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.rowHeight = 36
        tableView.isScrollEnabled = false

        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var buttonAddGroceries: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Groceries", for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = UIColor(red: 0.19, green: 0.52, blue: 0.42, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(containerView)
        containerView.addSubViews(groceriesLabel,dateLabel,groceriesTableView, buttonAddGroceries)
        styleForCell()
        setUpGroceriesTableView()
        initConstraints()

    }
    
    private func styleForCell(){
        contentView.layer.cornerRadius = 12
//        contentView.layer.masksToBounds = true
//        contentView.layer.shadowColor = UIColor.gray.cgColor
//        contentView.layer.shadowOffset = .zero
//        contentView.layer.shadowRadius = 4.0
//        contentView.layer.shadowOpacity = 0.4
//        contentView.layer.borderWidth = 1.2
//        contentView.layer.borderColor = UIColor.secondarySystemBackground.cgColor
    }
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            groceriesLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            groceriesLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            groceriesLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: groceriesLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            
            groceriesTableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            groceriesTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            groceriesTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
           
            buttonAddGroceries.topAnchor.constraint(equalTo: groceriesTableView.bottomAnchor),
            buttonAddGroceries.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            buttonAddGroceries.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            buttonAddGroceries.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
        ])
    }
    
    private func setUpGroceriesTableView(){
        groceriesTableView.dataSource = workOutManager
        groceriesTableView.delegate = workOutManager
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
