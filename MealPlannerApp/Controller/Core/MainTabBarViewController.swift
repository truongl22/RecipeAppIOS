//
//  ViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/27/23.
//

import UIKit

// Handle tabs 
final class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpTabs()
    }
    
    private func setUpTabs(){
        let plannerVC = PlannerViewController()
        let workoutVC = WorkoutViewController()
        let groceriesVC = GroceriesViewController()
        let profileVC = ProfileViewController()
        let mealplannerVC = MealPlanViewController()
        
        let vc1 = UINavigationController(rootViewController: profileVC)
        let vc2 = UINavigationController(rootViewController: mealplannerVC)
        let vc3 = UINavigationController(rootViewController: groceriesVC)
        let vc4 = UINavigationController(rootViewController: workoutVC)
        let vc5 = UINavigationController(rootViewController: plannerVC)
        
        profileVC.navigationItem.largeTitleDisplayMode = .automatic
        groceriesVC.navigationItem.largeTitleDisplayMode = .automatic
        workoutVC.navigationItem.largeTitleDisplayMode = .automatic
        plannerVC.navigationItem.largeTitleDisplayMode = .automatic
        mealplannerVC.navigationItem.largeTitleDisplayMode = .automatic
        
        vc1.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        vc2.tabBarItem = UITabBarItem(title: "Meal Plan", image: UIImage(systemName: "fork.knife"), selectedImage: nil)
        vc3.tabBarItem = UITabBarItem(title: "Groceries", image: UIImage(systemName: "basket"), selectedImage: UIImage(systemName: "basket.fill"))
        vc4.tabBarItem = UITabBarItem(title: "Workout", image: UIImage(systemName: "dumbbell"), selectedImage: UIImage(systemName: "dumbbell.fill"))
        
        vc5.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "list.bullet"), selectedImage: nil)
        
        setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
    }

    

}

