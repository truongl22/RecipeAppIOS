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
        let todayVC = TodayViewController()
        let searchVC = SearchViewController()
        let healthVC = HealthTrackViewController()
        let plannerVC = PlannerViewController()
        let profileVC = ProfileViewController()
        
        let vc1 = UINavigationController(rootViewController: todayVC)
        let vc2 = UINavigationController(rootViewController: searchVC)
        let vc3 = UINavigationController(rootViewController: healthVC)
        let vc4 = UINavigationController(rootViewController: plannerVC)
        let vc5 = UINavigationController(rootViewController: profileVC)
        
        todayVC.navigationItem.largeTitleDisplayMode = .automatic
        searchVC.navigationItem.largeTitleDisplayMode = .automatic
        healthVC.navigationItem.largeTitleDisplayMode = .automatic
        plannerVC.navigationItem.largeTitleDisplayMode = .automatic
        profileVC.navigationItem.largeTitleDisplayMode = .automatic
        
        vc1.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "doc.text.image"), selectedImage: nil)
        vc2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil)
        vc3.tabBarItem = UITabBarItem(title: "Health", image: UIImage(systemName: "figure.run"), selectedImage: nil)
        vc4.tabBarItem = UITabBarItem(title: "Planner", image: UIImage(systemName: "list.bullet"), selectedImage: nil)
        vc5.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        
        setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
    }

    

}

