//
//  FlightStatusesTableView.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/12/23.
//

import UIKit
import Dispatch

class FlightStatusesTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var flightStatusTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        flightStatusTable.delegate = self
        flightStatusTable.dataSource = self
        
        InitVM()
    }
    
    var viewModel : FlightStatusesTableViewModel = {
        FlightStatusesTableViewModel()
    }()
    
    func InitVM(){
        viewModel.getStatuses { errorMessage in
            let alertView = UIAlertController(title: "Error!", message: errorMessage, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertView.addAction(alertAction)
            DispatchQueue.main.async {[weak self] in
                self?.present(alertView, animated: true, completion: nil)
            }
        }
        viewModel.reloadTable = {[weak self] in
            DispatchQueue.main.async {
                self?.flightStatusTable.reloadData()
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightStatus", for: indexPath) as? FlightStatusCell
        
        cell?.cellModel = viewModel.getCellModel(indexPath: indexPath)
        
        return cell!
    }
}
