//
//  ProfileViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/28/23.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    private var userRecipeCollectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return ProfileViewController.createSection(for: sectionIndex)
        }
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(FromYourRecipeCollectionViewCell.self, forCellWithReuseIdentifier: FromYourRecipeCollectionViewCell.identifier)
        collection.register(CuisineCollectionViewCell.self, forCellWithReuseIdentifier: CuisineCollectionViewCell.identifier)
        collection.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeader.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let plusFloatingButton = {
        let button = UIButton(type: .system)
        let plussign = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold))
        button.setImage(plussign, for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0.19, green: 0.52, blue: 0.42, alpha: 1.00)
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(plusProfileScreenButtonTapped), for: .touchUpInside)
        
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.4
        
        return button
    }()
    
    @objc func plusProfileScreenButtonTapped(){
        print("hiiii")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        view.addSubViews(userRecipeCollectionView, plusFloatingButton)
        userRecipeCollectionView.pin(to: view)
        setUpConstraintsForButton()
        
        userRecipeCollectionView.delegate = self
        userRecipeCollectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser == nil{
            let vc = UINavigationController(rootViewController: LoginPageViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
            
        }
    }
    
    private func setUpConstraintsForButton(){
        NSLayoutConstraint.activate([
            plusFloatingButton.widthAnchor.constraint(equalToConstant: 60),
            plusFloatingButton.heightAnchor.constraint(equalToConstant: 60),
            plusFloatingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            plusFloatingButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FromYourRecipeCollectionViewCell.identifier, for: indexPath) as? FromYourRecipeCollectionViewCell else{
            fatalError("Unsupported Cell")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView( ofKind: kind, withReuseIdentifier: ProfileHeader.identifier, for: indexPath) as? ProfileHeader, kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        return header
    }
    
    
    private static func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection{
        let supplementaryViews = [ NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(200)),
            elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
        
        switch sectionIndex {
        case 0:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize( widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(120)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = supplementaryViews
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 0, trailing: 8)
            return section
        case 1:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0),
                                                                                  heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.45),
                    heightDimension: .absolute(220)),
                subitems: [item]
            )
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
            section.boundarySupplementaryItems = supplementaryViews
            return section
        default:
            let item = NSCollectionLayoutItem( layoutSize: NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0),
                                                                                   heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(150)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = supplementaryViews
            return section
        }
    } 
}
