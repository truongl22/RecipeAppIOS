//
//  MealsCollectionViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/12/23.
//

import UIKit

class MealsCollectionViewCell: UICollectionViewCell {
    static let identifier = "MealsCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
