//
//  GroceriesViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/23/23.
//

import UIKit

enum GrocerySection {
    case main
}

class GroceriesViewController: UIViewController {

    private var groceriesViewViewModel: [GroceriesViewViewModel] = [GroceriesViewViewModel(item: "Apple", quantity: "15lbs"),
                                                                    GroceriesViewViewModel(item: "Orange", quantity: "75lbs")]
    
    private var groceriesCollectionView: UICollectionView = {
        let layout = UICollectionLayoutListConfiguration(appearance: .grouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: layout)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: listLayout)
        collection.register(GroceriesCollectionViewCell.self, forCellWithReuseIdentifier: GroceriesCollectionViewCell.identifier)
//        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
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
        title = "Groceries"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubViews(groceriesCollectionView, plusFloatingButton)
        groceriesCollectionView.pin(to: view)
        groceriesCollectionView.delegate = self
        groceriesCollectionView.dataSource = self
        setUpConstraintsForButton()
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

extension GroceriesViewController: UICollectionViewDataSource, UICollectionViewDelegate, ChangeCheckButtonGroceryDelegate {
    func changeButton(checked: Bool, indexPath: Int) {
        groceriesViewViewModel[indexPath].hasCheck = checked
        groceriesCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groceriesViewViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroceriesCollectionViewCell.identifier, for: indexPath) as? GroceriesCollectionViewCell else{
           fatalError("Unsupported Cell")
        }
        cell.delegate = self
        let model = groceriesViewViewModel[indexPath.row]
        cell.configure(with: model, indexPath: indexPath.row)
        return cell
    }
    
    
}
