//
//  HomeWorkOutTableViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/5/23.
//

import UIKit

class TodayWorkOutTableViewCell: UITableViewCell {
//    private let workOutTableViewManager = WorkOutTableViewManager()
    
    static let identifier = "TodayWorkOutTableViewCell"
    
//    private var workOutScheduleTableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .plain)
//        tableView.separatorStyle = .none
//        tableView.register(WorkOutScheduleTableViewCell.self, forCellReuseIdentifier: WorkOutScheduleTableViewCell.identifier)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
    
    private var labelWorkOut: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "WORK OUT SCHEDULE"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var workOutInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.text = "Today is Chest Day!!"
        label.textColor = .black
        return label
    }()
    
    private let wrapperCellView: UIView = {
        let wrapper = UITableViewCell()
        wrapper.backgroundColor = .blue
        wrapper.layer.cornerRadius = 8.0
        wrapper.layer.shadowColor = UIColor.gray.cgColor
        wrapper.layer.shadowOffset = .zero
        wrapper.layer.shadowRadius = 4.0
        wrapper.layer.shadowOpacity = 0.4
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        return wrapper
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews(wrapperCellView)
//        wrapperCellView.addSubViews(labelWorkOut, workOutInfo)
        initConstraints()
//        setUpWorkOutScheduleCollectionView()
    }

    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//
//            labelWorkOut.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 14),
//            labelWorkOut.leftAnchor.constraint(equalTo: wrapperCellView.leftAnchor, constant: 16),
//            labelWorkOut.rightAnchor.constraint(equalTo: wrapperCellView.rightAnchor, constant: -16),
//
//            workOutInfo.topAnchor.constraint(equalTo: labelWorkOut.bottomAnchor, constant: 10),
//            workOutInfo.leftAnchor.constraint(equalTo: labelWorkOut.leftAnchor),
            
//            workOutScheduleTableView.topAnchor.constraint(equalTo: workOutInfo.bottomAnchor, constant: 20),
//            workOutScheduleTableView.leftAnchor.constraint(equalTo: wrapperCellView.leftAnchor, constant: 16),
//            workOutScheduleTableView.rightAnchor.constraint(equalTo: wrapperCellView.rightAnchor, constant: -16),
//            workOutScheduleTableView.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -10),
        
            wrapperCellView.heightAnchor.constraint(equalToConstant: 420)
        ])
    }
//
//    private func setUpWorkOutScheduleCollectionView(){
//        workOutScheduleTableView.dataSource = workOutTableViewManager
//        workOutScheduleTableView.delegate = workOutTableViewManager
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
