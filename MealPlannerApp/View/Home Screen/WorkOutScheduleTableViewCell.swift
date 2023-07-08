////
////  WorkOutScheduleTableViewCell.swift
////  MealPlannerApp
////
////  Created by Lâm Trương on 7/5/23.
////
//
//import UIKit
//
//class WorkOutScheduleTableViewCell: UITableViewCell {
//
//    static let identifier = "WorkOutScheduleTableViewCell"
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(wrapperCellView)
//        backgroundColor = .systemBackground
//        wrapperCellView.addSubview(label)
//        initConstraints()
//       
//    }
//    
//    private let wrapperCellView: UIView = {
//        let wrapper =  UITableViewCell()
//        wrapper.translatesAutoresizingMaskIntoConstraints = false
//        return wrapper
//    }()
//    
//    private let label: UILabel = {
//        let lab =  UILabel()
//        lab.text = "- Walking"
//        lab.translatesAutoresizingMaskIntoConstraints = false
//        return lab
//    }()
//        
//    
//    private func initConstraints(){
//        NSLayoutConstraint.activate([
//            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor),
//            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            wrapperCellView.heightAnchor.constraint(equalToConstant: 40),
//            
//            label.topAnchor.constraint(equalTo: wrapperCellView.topAnchor),
//            label.leftAnchor.constraint(equalTo: wrapperCellView.leftAnchor),
//            label.rightAnchor.constraint(equalTo: wrapperCellView.rightAnchor),
//            
//            
//            
//        
//        ])
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}
