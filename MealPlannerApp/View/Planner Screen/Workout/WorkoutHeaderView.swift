//
//  InstructionsHeaderView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/13/23.
//

import UIKit

class WorkoutHeaderView: UITableViewHeaderFooterView {
    
    //    private var checkLabel: UIButton = {
    //        let button = UIButton()
    //        button.setImage(UIImage(systemName: "checkmark.square")?.withRenderingMode(.alwaysOriginal), for: .normal)
    //        button.contentHorizontalAlignment = .fill
    //        button.contentVerticalAlignment = .fill
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        return button
    //    }()
    
    private var checkImage: UIImageView = {
        let check = UIImageView()
        check.image = UIImage(systemName: "checkmark.square")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        check.contentMode = .scaleToFill
        check.clipsToBounds = true
        check.layer.masksToBounds = true
        check.translatesAutoresizingMaskIntoConstraints = false
        return check
    }()
    
    private var exerciseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "Exercise"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var setLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "Best Set"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubViews(checkImage, exerciseLabel, setLabel)
        initConstraints()
    }
    
    
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            checkImage.widthAnchor.constraint(equalToConstant: 16),
            checkImage.heightAnchor.constraint(equalToConstant: 16),
            checkImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6),
            checkImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            
            exerciseLabel.leftAnchor.constraint(equalTo: checkImage.rightAnchor, constant: 16),
            exerciseLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            
            setLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -13),
            setLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6), 
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
