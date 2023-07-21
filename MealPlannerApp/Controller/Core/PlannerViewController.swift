//
//  HomeViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/28/23.
//

import UIKit

class PlannerViewController: UIViewController {
    
    private let plannerView = PlannerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
        title = "Today"
        view.addSubview(plannerView)
        setUpView()
        
        plannerView.cardsCollectionView?.dataSource = self
        plannerView.cardsCollectionView?.delegate = self
    }
    
    private func setUpView(){
        NSLayoutConstraint.activate([
            plannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            plannerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            plannerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            plannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension PlannerViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayWorkOutCollectionViewCell.identifier, for: indexPath) as? TodayWorkOutCollectionViewCell else{
                fatalError("Unsupported Cell")
            }
            return cell
        }
        
        if indexPath.item == 1{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealPlannerCollectionViewCell.identifier, for: indexPath) as? MealPlannerCollectionViewCell else{
                fatalError("Unsupported Cell")
            }
            return cell
        }
        
        else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroceryCollectionViewCell.identifier, for: indexPath) as? GroceryCollectionViewCell else{
                fatalError("Unsupported Cell")
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 22)
        return CGSize(
            width: width,
            height: width * 1.006
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let workOutViewController = WorkOutViewController()
//        workOutViewController.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(workOutViewController, animated: true)
    }
}
