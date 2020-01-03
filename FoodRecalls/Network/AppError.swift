//
//  AppError.swift
//  FoodRecalls
//
//  Created by Melinda Diaz on 12/30/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import Foundation

enum AppError: Error {
case badURL(String) // associated value
case noResponse
case networkClientError(Error) // no internet connection
case badData
case decodingError(Error)
case badStatusCode(Int) // 404, 500
}
