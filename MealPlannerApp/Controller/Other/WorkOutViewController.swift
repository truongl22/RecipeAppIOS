//
//  WorkOutViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/12/23.
//

import UIKit

class WorkOutViewController: UIViewController {

    var workoutDetailView = WorkoutDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(workoutDetailView)
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Today Workout"
        setUpView()
        

        // Do any additional setup after loading the view.
    }
    
    private func setUpView(){
        NSLayoutConstraint.activate([
            workoutDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            workoutDetailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            workoutDetailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            workoutDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }


}
