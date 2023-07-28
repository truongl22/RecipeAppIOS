//
//  WorkoutDetailView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/19/23.
//

import UIKit

class WorkoutDetailView: UIView {
    private let workOutManager = WorkOutManager()
    

    private var workOutScheduleTableView: UITableView = {
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
    
    private var textField1: UITextField = {
        let textFieldName = UITextField()
        textFieldName.placeholder = "Excercise"
        textFieldName.keyboardType = .default
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        return textFieldName
    }()
    
    private var textField2: UITextField = {
        let textFieldName = UITextField()
        textFieldName.placeholder = "Sets"
        textFieldName.keyboardType = .default
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        return textFieldName
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .secondarySystemBackground
        addSubViews(workOutScheduleTableView, textField1, textField2)
        setUpWorkOutScheduleCollectionView()
        initConstraints()
   
    }
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            workOutScheduleTableView.topAnchor.constraint(equalTo: self.topAnchor),
            workOutScheduleTableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            workOutScheduleTableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            workOutScheduleTableView.heightAnchor.constraint(equalToConstant: 100),
//            workOutScheduleTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            textField1.topAnchor.constraint(equalTo: workOutScheduleTableView.bottomAnchor, constant: 10),
            textField1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            
            textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 10),
            textField2.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            
        ])
    }
    
    private func setUpWorkOutScheduleCollectionView(){
        workOutScheduleTableView.dataSource = workOutManager
        workOutScheduleTableView.delegate = workOutManager
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
