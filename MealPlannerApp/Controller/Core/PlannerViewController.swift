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
        title = "Today"
        view.addSubview(plannerView)
        setUpView()
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
