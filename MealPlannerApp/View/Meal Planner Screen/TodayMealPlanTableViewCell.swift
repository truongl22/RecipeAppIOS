//
//  TodayMealPlanTableViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/24/23.
//

import UIKit

class TodayMealPlanTableViewCell: UITableViewCell {
    static let identifier = "TodayMealPlanTableViewCell"
    
    private let mealImage: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = . brown
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private var mealTitle: UILabel = {
        let label = UILabel()
        label.text = "Korean-Style Beef Rice with Cucumbers"
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews(mealImage, mealTitle)
        initConstraints()
    }
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            mealImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            mealImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            mealImage.widthAnchor.constraint(equalToConstant: 100),
            mealImage.heightAnchor.constraint(equalToConstant: 100),
            
            mealTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mealTitle.leftAnchor.constraint(equalTo: mealImage.rightAnchor, constant: 16),
            mealTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
        
    }
    
//    public func configure(with viewModel: StepArray){
//        print(viewModel)
//        instructionLabel.text = viewModel.step
//        stepNumberLabel.text = String(viewModel.number)
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
