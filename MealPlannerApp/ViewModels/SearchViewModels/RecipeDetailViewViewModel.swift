//
//  RecipeDetailViewViewModel.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/10/23.
//

import Foundation

protocol RecipeDetailViewViewModelProtocol: AnyObject{
    func didLoad()
}

final class RecipeDetailViewViewModel{
    public weak var delegate: RecipeDetailViewViewModelProtocol?
    
    private let detailedRecipe: RecipesByIngredients
    public var instructions: [RecipeInstructions] = []
    
    public var onDataUpdated: (() -> Void)?
    
    
    init(detailedRecipe: RecipesByIngredients){
        self.detailedRecipe = detailedRecipe
    }
    
    public var title: String{
        detailedRecipe.title.uppercased()
    }
    
    public func numberOfInstructions() -> Int {
           return instructions.count
    }
    
    
    
    public func fetchRecipesInstructions(){
        let id = String(detailedRecipe.id)
        let query = URLQueryItem(name: "id", value: id)
        let request = Request(endpoint: Endpoint.analyzedInstructions, queryParameters: [query])
        
        Service.shared.execute(request, expecting: RecipeInstructions.self){ [weak self] result in
            switch result{
            case .success(let resultModel):
                self?.instructions = resultModel
                
                self?.onDataUpdated?()
                
//                print(self?.instructions[0].steps)
                DispatchQueue.main.async {
                    self?.delegate?.didLoad()
                }
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    /// Fetch images to display result of searched recipes
    /// - Parameter completion: <#completion description#>
    public func fetchRecipeImage(completion: @escaping (Result<Data, Error>) -> Void ){
        guard let imageURL = URL(string: detailedRecipe.image) else{
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
