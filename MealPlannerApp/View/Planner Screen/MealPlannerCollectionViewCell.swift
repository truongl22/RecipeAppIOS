//
//  MealPlannerCollectionViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/11/23.
//

import UIKit

class MealPlannerCollectionViewCell: UICollectionViewCell {
    static let identifier = "MealPlannerCollectionViewCell"
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var mealPlannerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "Meal Planner"
        label.textColor = .black
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
    
    private var mealsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MealsCollectionViewCell.self, forCellWithReuseIdentifier: MealsCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var buttonAddNewMeal: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add new Food", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 0.00, green: 0.85, blue: 0.83, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(containerView)
        containerView.addSubViews(mealPlannerLabel,dateLabel,mealsCollectionView, buttonAddNewMeal)
        styleForCell()
        initConstraints()

    }
    
    private func styleForCell(){
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 4.0
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.borderWidth = 1.2
        contentView.layer.borderColor = UIColor.secondarySystemBackground.cgColor
    }
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            mealPlannerLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            mealPlannerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mealPlannerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: mealPlannerLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            
            mealsCollectionView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            mealsCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mealsCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            buttonAddNewMeal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            buttonAddNewMeal.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            buttonAddNewMeal.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
        ])
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
