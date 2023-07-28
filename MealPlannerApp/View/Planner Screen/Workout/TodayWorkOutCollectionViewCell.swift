//
//  HomeWorkOutTableViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/5/23.
//

import UIKit

//class TodayWorkOutCollectionViewCell: UICollectionViewCell{
//    static let identifier = "TodayWorkOutCollectionViewCell"
//    private let workOutManager = WorkOutManager()
//
//    private var containerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private var workOutScheduleTableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(TodayWorkOutTableViewCell.self, forCellReuseIdentifier: TodayWorkOutTableViewCell.identifier)
//        tableView.register(WorkoutHeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
////        tableView.backgroundColor = .green
//        tableView.layoutMargins = UIEdgeInsets.zero
//        tableView.separatorInset = UIEdgeInsets.zero
//        tableView.rowHeight = 36
//        tableView.isScrollEnabled = false
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
//
//    private var workOutInfo: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
//        label.text = "Evening Workout"
//        label.textColor = UIColor(red: 0.00, green: 0.12, blue: 0.17, alpha: 1.00)
//        return label
//    }()
//
//    private var dateLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        label.text = "Tuesday, Jul 11"
//        label.textColor = .gray
//        return label
//    }()
//
//    private var buttonStartWorkOut: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Start Workout", for: .normal)
//        button.layer.cornerRadius = 6
//        button.backgroundColor = UIColor(red: 0.19, green: 0.52, blue: 0.42, alpha: 1.00)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(buttonStartWorkOutTapped(_:)), for: .touchUpInside)
//        return button
//    }()
//
//    @objc func buttonStartWorkOutTapped(_ sender: UIButton) {
//        print("aaa")
//       }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        contentView.backgroundColor = .secondarySystemBackground
//        contentView.backgroundColor = .white
//        contentView.addSubview(containerView)
//        containerView.addSubViews(workOutInfo, workOutScheduleTableView,dateLabel,buttonStartWorkOut)
//        styleForCell()
//        initConstraints()
//        setUpWorkOutScheduleCollectionView()
//    }
//
//    private func styleForCell(){
//        contentView.layer.cornerRadius = 12
////        contentView.layer.masksToBounds = true
////        contentView.layer.shadowColor = UIColor.gray.cgColor
////        contentView.layer.shadowOffset = .zero
////        contentView.layer.borderColor = UIColor.secondarySystemBackground.cgColor
////        contentView.layer.shadowRadius = 4.0
////        contentView.layer.shadowOpacity = 0.4
////        contentView.layer.borderWidth = 1.2
//    }
//
//    private func initConstraints(){
//        NSLayoutConstraint.activate([
//            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
//            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
//            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
//            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
//
//            workOutInfo.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2),
//            workOutInfo.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 2),
//            workOutInfo.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2),
//
//            dateLabel.topAnchor.constraint(equalTo: workOutInfo.bottomAnchor, constant: 10),
//            dateLabel.leadingAnchor.constraint(equalTo: workOutInfo.leadingAnchor),
//            dateLabel.trailingAnchor.constraint(equalTo: workOutInfo.trailingAnchor),
//
//            workOutScheduleTableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
//            workOutScheduleTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//            workOutScheduleTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//
//            buttonStartWorkOut.topAnchor.constraint(equalTo: workOutScheduleTableView.bottomAnchor),
//            buttonStartWorkOut.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            buttonStartWorkOut.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            buttonStartWorkOut.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -4),
//
//        ])
//    }
//
//    private func setUpWorkOutScheduleCollectionView(){
//        workOutScheduleTableView.dataSource = workOutManager
//        workOutScheduleTableView.delegate = workOutManager
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}

class TodayWorkOutCollectionViewCell: UICollectionViewCell{
    static let identifier = "TodayWorkOutCollectionViewCell"
    var WorkoutModels: [WorkoutInfoModel] = [WorkoutInfoModel(exercise: "run", bestset: "yyyy")]
    
    let workoutAndGroceriesTableViewManager = WorkoutAndGroceriesTableViewManager<WorkoutInfoModel>()
    
    //    var personDataSource: WorkoutAndGroceriesTableViewManager<WorkOuttt>!
    
    private let workOutManager = WorkOutManager()
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var workOutScheduleTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WorkoutAndGroceriesTableViewCell<WorkoutInfoModel>.self, forCellReuseIdentifier: String(describing: WorkoutAndGroceriesTableViewCell<WorkoutInfoModel>.self))
        tableView.register(WorkoutHeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
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
    
    private var buttonStartWorkOut: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Workout", for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = UIColor(red: 0.19, green: 0.52, blue: 0.42, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonStartWorkOutTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonStartWorkOutTapped(_ sender: UIButton) {
        print("aaa")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(containerView)
        containerView.addSubViews(workOutInfo, workOutScheduleTableView,dateLabel,buttonStartWorkOut)
        styleForCell()
        initConstraints()
        setUpWorkOutScheduleCollectionView()
    }
    
    private func styleForCell(){
        contentView.layer.cornerRadius = 12
        //        contentView.layer.masksToBounds = true
        //        contentView.layer.shadowColor = UIColor.gray.cgColor
        //        contentView.layer.shadowOffset = .zero
        //        contentView.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        //        contentView.layer.shadowRadius = 4.0
        //        contentView.layer.shadowOpacity = 0.4
        //        contentView.layer.borderWidth = 1.2
    }
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            workOutInfo.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2),
            workOutInfo.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 2),
            workOutInfo.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2),
            
            dateLabel.topAnchor.constraint(equalTo: workOutInfo.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: workOutInfo.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: workOutInfo.trailingAnchor),
            
            workOutScheduleTableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            workOutScheduleTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            workOutScheduleTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            buttonStartWorkOut.topAnchor.constraint(equalTo: workOutScheduleTableView.bottomAnchor),
            buttonStartWorkOut.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            buttonStartWorkOut.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            buttonStartWorkOut.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -4),
            
        ])
    }
    
    private func setUpWorkOutScheduleCollectionView(){
        //      let personDataSource = WorkoutAndGroceriesTableViewManager(viewModels: WorkoutModels)
        workOutScheduleTableView.dataSource = workoutAndGroceriesTableViewManager
        workOutScheduleTableView.delegate = workoutAndGroceriesTableViewManager
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
