//
//  HomeWorkOutTableViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/5/23.
//

import UIKit

class TodayWorkOutCollectionViewCell: UICollectionViewCell{
    static let identifier = "TodayWorkOutCollectionViewCell"
    
    private let workOutManager = WorkOutManager()
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var workOutScheduleTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TodayWorkOutTableViewCell.self, forCellReuseIdentifier: TodayWorkOutTableViewCell.identifier)
//        tableView.backgroundColor = .green
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.rowHeight = 36
        tableView.isScrollEnabled = false

        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private var workOutInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "Evening Workout"
        label.textColor = .black
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
    
    private var buttonStartWorkOut: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Workout", for: .normal)
        button.layer.cornerRadius = 8
//        button.backgroundColor = UIColor(red: 0.00, green: 0.42, blue: 1.00, alpha: 1.00)
        button.backgroundColor = UIColor(red: 0.98, green: 0.62, blue: 0.62, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
      
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .secondarySystemBackground
        contentView.backgroundColor = .white
        contentView.addSubview(containerView)
        containerView.addSubViews(workOutInfo, workOutScheduleTableView,dateLabel,buttonStartWorkOut)
        styleForCell()
        initConstraints()
        setUpWorkOutScheduleCollectionView()
    }
    
    private func styleForCell(){
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 4.0
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.borderWidth = 1.2
        contentView.layer.borderColor = UIColor.secondarySystemBackground.cgColor
    }
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            workOutInfo.topAnchor.constraint(equalTo: containerView.topAnchor),
            workOutInfo.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            workOutInfo.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: workOutInfo.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            
            workOutScheduleTableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            workOutScheduleTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            workOutScheduleTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
           
            buttonStartWorkOut.topAnchor.constraint(equalTo: workOutScheduleTableView.bottomAnchor),
            buttonStartWorkOut.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            buttonStartWorkOut.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            buttonStartWorkOut.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
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
