//
//  ProfileView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/13/23.
//

import UIKit

class ProfileView: UIView {
    
    let userProfileViewViewModel = UserProfileViewViewModel()
    
    private let recipeInCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isHidden = false
        collection.backgroundColor = .yellow
//        collection.alpha = 0
        collection.register(ProfileRecipeCollectionViewCell.self, forCellWithReuseIdentifier: ProfileRecipeCollectionViewCell.identifier)
        collection.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeader.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground
        addSubview(recipeInCollectionView)
        initConstraints()
        setUprecipeInCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstraints(){
//        recipeInCollectionView.pin(to: self)
        NSLayoutConstraint.activate([
            recipeInCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            recipeInCollectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            recipeInCollectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            recipeInCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
   
            
        ])
    }
    
    private func setUprecipeInCollectionView(){
        recipeInCollectionView.dataSource = userProfileViewViewModel
        recipeInCollectionView.delegate = userProfileViewViewModel
    }
}
