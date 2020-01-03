//
//  FoodRecallTableViewCell.swift
//  FoodRecalls
//
//  Created by Melinda Diaz on 12/30/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import UIKit

class FoodRecallTableViewCell: UITableViewCell {

    
    @IBOutlet weak var foodRecallOutlet: UILabel!
    
    @IBOutlet weak var foodOutlet: UILabel!
    
    
    
    func setUpCell(eachCell: FDAResult) {
          foodRecallOutlet.text = eachCell.info ?? "NA"
        foodOutlet.text = eachCell.productDescription
      }
    
}
