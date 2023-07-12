//
//  HomeViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/28/23.
//

import UIKit

class TodayViewController: UIViewController {
    
    private let todayView = TodayView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Today"
        view.addSubview(todayView)
        
        todayView.pin(to: view)
    }
    
    
    
}
