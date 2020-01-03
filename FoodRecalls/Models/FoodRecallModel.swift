//
//  FoodRecallModel.swift
//  FoodRecalls
//
//  Created by Melinda Diaz on 12/27/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import Foundation

struct Meta: Codable {
    let result: [FDAResult]
    let meta: [FDAMeta]
    
    enum FirstCodingKey: String, CodingKey {
        case result = "results"
        case meta = "meta"
    }
}
struct FDAMeta: Codable {
    let lastUpdate: String
    
    enum SwiftlyData: String, CodingKey {
        case lastUpdate = "last_updated"
    }
}

struct FDAResult: Codable {
   
    let city: String?
    let reason: String?
    let info: String?
    let productQuantity: String?
    let distribution: String?
    let state: String?
    let productDescription: String?
    let classification: String?
    let recallNumber: String?
    let reportDate: String?
    let recallDate: String?
    
    //coding keys take the RAW DATA and turn it into something the compiler can understand. (more swiftly)
    enum CodingKeys: String, CodingKey {
       
        case city = "city"
        case reason = "reason_for_recall"
        case info = "code_info"
        case productQuantity = "product_quantity"
        case distribution = "distribution_pattern"
        case state = "state"
        case productDescription = "product_description"
        case classification = "classification"
        case recallNumber = "recall_number"
        case reportDate = "report_date"
        case recallDate = "recall_initiation_date"
       
        
       
        
    
        
    }
}


