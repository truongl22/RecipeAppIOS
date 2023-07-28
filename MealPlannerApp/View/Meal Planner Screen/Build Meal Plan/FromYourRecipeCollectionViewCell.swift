//
//  FromYourRecipeCollectionViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/25/23.
//

import UIKit

class FromYourRecipeCollectionViewCell: UICollectionViewCell {
    static let identifier = "FromYourRecipeCollectionViewCell"
    
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
        label.text = "Breakfast"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleForCell()
        addSubViews(mealTitle)
        initConstraints()
        contentView.backgroundColor = .systemPink
    }
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            mealTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            mealTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
        ])
    }
    
    private func styleForCell(){
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
    }
    
    public func configure(with viewModel: BuildPlanViewViewModel){
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mealTitle.text = nil
    }

}
