//
//  APIClient.swift
//  FoodRecalls
//
//  Created by Melinda Diaz on 12/30/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import Foundation


struct APIClient {
    
    //@escaping waits patiently for the API data, because it's a network call (Asynchronous: Not done right away) we don't know when we are going to get our data.
    static func getFoodRecalls(for urlString: String,
                            completion: @escaping (Result<Meta, AppError>) -> ()) {
        
       guard let url = URL(string: urlString) else { completion(.failure(.badURL(urlString)))
                   return
                   }
        
               let urlRequest = URLRequest(url: url)
               NetworkHelper.shared.performDataTask(request: urlRequest) { (result) in
              switch result {
              case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
              case .success(let data):
                do {//any function that uses an error you must try//anytime you decode data from JSON you need to include .self
                  let searchResults = try JSONDecoder().decode(Meta.self, from: data)
                   completion(.success(searchResults))
                  // 2. capture the array of results in the completion handler
                    //completion(.success(searchResults.results))
                  
                } catch {
                  completion(.failure(.decodingError(error)))
                }
              }
            }
          }
}
