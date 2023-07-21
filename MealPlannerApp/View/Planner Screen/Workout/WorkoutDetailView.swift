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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .secondarySystemBackground
        addSubViews(workOutScheduleTableView)
        setUpWorkOutScheduleCollectionView()
        initConstraints()
   
    }
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            workOutScheduleTableView.topAnchor.constraint(equalTo: self.topAnchor),
            workOutScheduleTableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            workOutScheduleTableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            workOutScheduleTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
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
