//
//  HomeViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/28/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let query1 = URLQueryItem(name: "ingredients", value: "Apple")
        let query2 = URLQueryItem(name: "number", value: "1")
        
        let request = Request(endpoint: Endpoint.findByIngredients, queryParameters: [query1, query2] )
        print(request.url)
        
        Service.shared.execute(request, expecting: RecipesByIngredients.self){ result in
            switch result{
            case .success:
                break
            case .failure(let error):
                print(String(describing: error))
            }
            
        }
    }
    


}
