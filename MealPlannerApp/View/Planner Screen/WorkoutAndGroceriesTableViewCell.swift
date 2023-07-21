//
//  WorkoutAndGroceriesTableViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/20/23.
//

import UIKit

protocol CellConfigurable {
    associatedtype ViewModel
    func configure(with viewModel: ViewModel)
}

class WorkoutAndGroceriesTableViewCell<ViewModel>: UITableViewCell, CellConfigurable {

    private var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.square.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setImage(UIImage(named: "checkmark.square"), for: .selected)
        button.addTarget(self, action: #selector(checkboxButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func checkboxButtonTapped(_ sender: UIButton) {
        print("bbb")
        sender.isSelected = !sender.isSelected
    }
    
    private var exerciseAndGroceriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(red: 0.00, green: 0.12, blue: 0.17, alpha: 1.00)
        return label
    }()
    
    private var bestSetAndQuantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(red: 0.00, green: 0.12, blue: 0.17, alpha: 1.00)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews(exerciseAndGroceriesLabel, bestSetAndQuantityLabel,checkButton)
        initConstraints()
    }
    
    private func initConstraints(){
        
        NSLayoutConstraint.activate([
            checkButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
            exerciseAndGroceriesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            exerciseAndGroceriesLabel.leftAnchor.constraint(equalTo: checkButton.rightAnchor, constant: 16),
            bestSetAndQuantityLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            bestSetAndQuantityLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            
        ])
        
    }
    
    func configure(with viewModel: ViewModel) {
        if let workOutViewModel = viewModel as? WorkoutInfoModel {
            exerciseAndGroceriesLabel.text = workOutViewModel.exercise
            bestSetAndQuantityLabel.text = workOutViewModel.bestset
        }
            
        else if let groceriesViewModel = viewModel as? GroceriesInfoModel {
            exerciseAndGroceriesLabel.text = groceriesViewModel.grocery
            bestSetAndQuantityLabel.text = groceriesViewModel.quantity
        }
    }
        
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
}
