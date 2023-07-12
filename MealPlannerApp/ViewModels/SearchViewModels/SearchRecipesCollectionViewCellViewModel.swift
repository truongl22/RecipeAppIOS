//
//  SearchRecipesCollectionViewCellViewModel.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/7/23.
//

import Foundation
import UIKit

struct SearchRecipesCollectionViewCellViewModel{
    let foodName: String
    private let foodImageURL: URL?
    
    init(foodName: String, foodImageURL: URL?) {
        self.foodName = foodName
        self.foodImageURL = foodImageURL
    }
    
    
    /// Fetch images to display result of searched recipes
    /// - Parameter completion: <#completion description#>
    public func fetchRecipeImage(completion: @escaping (Result<Data, Error>) -> Void ){
        guard let imageURL = foodImageURL else{
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: imageURL)
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else{
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        dataTask.resume()
    }
}
