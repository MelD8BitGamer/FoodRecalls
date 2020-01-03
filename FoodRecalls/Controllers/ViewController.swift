//
//  ViewController.swift
//  FoodRecalls
//
//  Created by Melinda Diaz on 12/27/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var foodRecall = [Meta]()
    var foodResults = [FDAResult]()
    
    @IBOutlet weak var searchOutlet: UISearchBar!
    
    
    @IBOutlet weak var recallTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        recallTableView.dataSource = self
        recallTableView.delegate = self
        
        dump(foodResults)
    }
    func setUp() {//having problems decoding this
        APIClient.getFoodRecalls(for: "https://api.fda.gov/food/enforcement.json?search=report_date:[20040101+TO+20191214]&limit=99") { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Error", message: "Cannot load food recalls \(appError)")
                }
            case .success(let data):
                self?.foodRecall = [data]
            }
        }
    }

}
//TODO: Fix error message decoding error message. (why is it finding Nil)????
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recallCell", for: indexPath) as? FoodRecallTableViewCell else { fatalError("Could not find Cell")}
        cell.setUpCell(eachCell: foodResults[indexPath.row])
        
          return cell
        }
    }
    
    
    
extension ViewController: UITableViewDelegate {
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
}
}
