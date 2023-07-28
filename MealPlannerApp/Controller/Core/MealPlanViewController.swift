//
//  MealPlannerViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/24/23.
//

import UIKit

class MealPlanViewController: UIViewController, MealPlanViewDelegate{
    func pushScreen(view: MealPlanView) {
        let buildPlanViewController = BuildPlanViewController()
        navigationController?.pushViewController(buildPlanViewController, animated: true)
    }
    
    private let mealPlanView = MealPlanView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Meal Plan"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(mealPlanView)
        setUpView()
        
        mealPlanView.todayMealPlanTableView?.delegate = self
        mealPlanView.todayMealPlanTableView?.dataSource = self
    }
    
    
    private func setUpView(){
        NSLayoutConstraint.activate([
            mealPlanView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mealPlanView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            mealPlanView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            mealPlanView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        mealPlanView.delegate = self
    }
    
}

extension MealPlanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayMealPlanTableViewCell.identifier, for: indexPath) as? TodayMealPlanTableViewCell else{
            fatalError("Unsupported Cell")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let buildPlanViewController = BuildPlanViewController()
//        navigationController?.pushViewController(buildPlanViewController, animated: true)
    }
    
    
}
    
    
