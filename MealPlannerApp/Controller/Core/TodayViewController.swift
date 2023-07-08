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
        
        
        //        NSLayoutConstraint.activate([
        //            todayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        //            todayView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        //            todayView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        //            todayView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        //        ])
        
        
        let query1 = URLQueryItem(name: "ingredients", value: "Apple")
        let query2 = URLQueryItem(name: "number", value: "3")
        
        let request = Request(endpoint: Endpoint.findByIngredients, queryParameters: [query1,query2])
        print(request.url)
        
        Service.shared.execute(request, expecting: RecipesByIngredients.self){ result in
            switch result{
            case .success(let resultModel):
                print(String(describing: resultModel[0].image))
            case .failure(let error):
                print(String(describing: error))
            }
            
        }
    }
    
    
    
}
