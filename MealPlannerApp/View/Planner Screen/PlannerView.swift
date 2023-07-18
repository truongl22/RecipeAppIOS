//
//  HomeView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/29/23.
//

import UIKit

class PlannerView: UIView {
    private let cardCollectionViewManager = CardCollectionViewManager()

    private var cardsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.register(TodayWorkOutCollectionViewCell.self, forCellWithReuseIdentifier: TodayWorkOutCollectionViewCell.identifier)
        collectionView.register(MealPlannerCollectionViewCell.self, forCellWithReuseIdentifier: MealPlannerCollectionViewCell.identifier)
        collectionView.register(GroceryCollectionViewCell.self, forCellWithReuseIdentifier: GroceryCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground
        self.addSubViews(cardsCollectionView)
        setUpCardCollectionView()

        initConstraints()
   
    }
    
    private func initConstraints(){
        cardsCollectionView.pin(to: self)
    }
    
    private func setUpCardCollectionView(){
        cardsCollectionView.dataSource = cardCollectionViewManager
        cardsCollectionView.delegate = cardCollectionViewManager
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
