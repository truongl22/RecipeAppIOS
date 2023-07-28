//
//  BuildPlanViewViewModel.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/25/23.
//

import Foundation

struct BuildPlanViewViewModel{
    let foodName: String
    private let foodImageURL: URL?
    private let id: Int
    
    init(foodName: String, foodImageURL: URL?, id: Int) {
        self.foodName = foodName
        self.foodImageURL = foodImageURL
        self.id = id
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
