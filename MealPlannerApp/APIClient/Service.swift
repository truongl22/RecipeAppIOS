//
//  Service.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/3/23.
//

import Foundation

/// an API Service that help getting the data
final class Service{
    /// shared singleton instance
    static let shared = Service()
    private let apiKey: String = "58f175c6676c4449973fdfe4d73f03c5"
    
    /// Notify if there is error
    enum errorNoti: Error{
        case CreateRequestError
        case GetDataError
    }
    
    private init(){}
    
    /// - Parameters: represent an API call
    ///   - request: a request created from Request class
    ///   - type: type we expect
    ///   - completion: callback with data or error
    public func execute<T: Codable>(_ request: Request, expecting type: T.Type, completion: @escaping (Result<Array<T>, Error>) -> Void){
        guard var urlRequest = self.request(from: request) else{
            completion(.failure(errorNoti.CreateRequestError))
            return
        }
        let dataTask = URLSession.shared.dataTask(with: urlRequest){ data,_, error in
            guard let data = data, error == nil else{
                completion(.failure(errorNoti.GetDataError))
                return
            }
            // Decode
            do{
                let json = try JSONDecoder().decode(Array<T>.self, from: data)
                completion(.success(json))
            }
            catch{
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
    private func request(from foodRequest: Request) -> URLRequest? {
        guard let url = foodRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = foodRequest.httpGetMethod
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        return request
    }
    
    
}
