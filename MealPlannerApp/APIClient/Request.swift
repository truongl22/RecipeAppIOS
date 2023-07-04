//
//  Request.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/3/23.
//

import Foundation

/// A class that represent API Call
final class Request{
    /// represent a base url of the API
    public let httpGetMethod = "GET"
    private struct baseURL{
        static let baseurl = "https://api.spoonacular.com/recipes/"
    }
    let endpoint: Endpoint
    let queryParameters: [URLQueryItem]
    
    /// Constructor for Request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - queryParameters: Collection of query parameters
    public init(endpoint: Endpoint, queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.queryParameters = queryParameters
    }
    
    /// Create url in String format
    private var urlString: String{
        var url = baseURL.baseurl
        url += endpoint.rawValue
        
        if !queryParameters.isEmpty{
            url += "?"
            for param in queryParameters{
                guard let value = param.value else {return ""}
                url += param.name + "=" + value
                if param != queryParameters.last{
                    url += "&"
                }
            }
        }
        return url
    }
    
    /// return an url
    public var url: URL?{
        return URL(string: urlString)
    }
}
