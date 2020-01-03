//
//  NetworkHelper.swift
//  FoodRecalls
//
//  Created by Melinda Diaz on 12/30/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import Foundation

class NetworkHelper {
        
        static let shared = NetworkHelper()
        
        private var session = URLSession(configuration: .default)
        
        private init (){
        }
        
    func performDataTask(request: URLRequest, completion: @escaping (Result<Data, AppError>) -> ()) {
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.networkClientError(error)))
                return
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            
            switch urlResponse.statusCode {
            case 200...299:
                break
            default:
                completion(.failure(.badStatusCode(urlResponse.statusCode)))
                return
            }
                completion(.success(data))
        }
            dataTask.resume()
        }
        
        
        
    }
    

