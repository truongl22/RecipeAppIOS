//
//  HeaderCollectionReusableView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/26/23.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    
    private let label: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 19, weight: .semibold)
        lable.textColor = .label
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(label)
        initConstraints()
    }
    
    private func initConstraints(){
        //        recipeImageResult.pin(to: contentView)
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
            
        ])
        
    }
    
    func configure(with title: String) {
        label.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
