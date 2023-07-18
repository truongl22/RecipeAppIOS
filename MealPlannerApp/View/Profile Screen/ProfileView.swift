//
//  ProfileView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/13/23.
//

import UIKit

class ProfileView: UIView {
    
    private var workOutScheduleTableView: UITableView = {
        let tableView = UITableView()
//        tableView.register(TodayWorkOutTableViewCell.self, forCellReuseIdentifier: TodayWorkOutTableViewCell.identifier)
//        tableView.register(WorkoutHeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        tableView.isScrollEnabled = false

        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstraints(){

    }
}
