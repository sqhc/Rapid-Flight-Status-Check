//
//  ScheduledFlightsView.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/13/23.
//

import UIKit
import Dispatch

class ScheduledFlightsView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var scheduledFlightsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scheduledFlightsTable.delegate = self
        scheduledFlightsTable.dataSource = self
        
        InitVM()
    }
    
    var viewModel: ScheduledFlightsTableViewModel = {
        ScheduledFlightsTableViewModel()
    }()
    
    func InitVM(){
        viewModel.getSchedules()
        viewModel.reloadTable = {[weak self] in
            DispatchQueue.main.async {
                self?.scheduledFlightsTable.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduledFlight", for: indexPath) as? ScheduledFlightCell
        cell!.cellModel = viewModel.getCellModel(indexPath: indexPath)
        return cell!
    }
}
