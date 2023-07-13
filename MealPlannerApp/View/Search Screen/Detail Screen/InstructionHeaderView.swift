//
//  InstructionHeaderView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/13/23.
//

import UIKit

class InstructionHeaderView: UIView {

    private let recipeImageResult: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .green
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var exerciseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "mvkemvkemkive"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .yellow
        addSubview(exerciseLabel)
        initConstraints()
    }

    private func initConstraints(){
//        recipeImageResult.pin(to: self)
        NSLayoutConstraint.activate([
            exerciseLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            exerciseLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2),
 
           
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
