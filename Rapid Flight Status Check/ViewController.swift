//
//  ViewController.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/11/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var departureYearTextField: UITextField!
    @IBOutlet weak var departureMonthTextField: UITextField!
    @IBOutlet weak var departureDayTextField: UITextField!
    @IBOutlet weak var arrivalYearTextField: UITextField!
    @IBOutlet weak var arrivalMonthTextField: UITextField!
    @IBOutlet weak var arrivalDayTextField: UITextField!
    @IBOutlet weak var departureAirportTextField: UITextField!
    @IBOutlet weak var arrivalAirportTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        departureYearTextField.delegate = self
        departureMonthTextField.delegate = self
        departureDayTextField.delegate = self
        arrivalYearTextField.delegate = self
        arrivalMonthTextField.delegate = self
        arrivalDayTextField.delegate = self
        departureAirportTextField.delegate = self
        arrivalAirportTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        flightStatusAPI = "https://flight-info-api.p.rapidapi.com/status?version=v1"
    }
    
    var viewModel : SearchStatusViewModel = {
        SearchStatusViewModel()
    }()

    @IBAction func checkFlightStatus(_ sender: UIButton){
        if viewModel.departureYear != "" && viewModel.departureMonth != "" && viewModel.departureDay != "" && viewModel.arrivalYear != "" && viewModel.arrivalMonth != "" && viewModel.arrivalDay != ""{
            if let vc = storyboard?.instantiateViewController(withIdentifier: "StatusesTable") as? FlightStatusesTableView{
                vc.viewModel.delegate = self.viewModel
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        else{
            let alertView = UIAlertController(title: "The missing of departure or arrival date", message: "The information of departure date and arrival date is required", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alertView.addAction(alertAction)
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    @IBAction func checkScheduled(_ sender: UIButton){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ScheduledFlights") as? ScheduledFlightsView{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let value = textField.text else{
            return true
        }
        switch textField{
        case departureYearTextField:
            viewModel.departureYear = value
        case departureMonthTextField:
            viewModel.departureMonth = value
        case departureDayTextField:
            viewModel.departureDay = value
        case arrivalYearTextField:
            viewModel.arrivalYear = value
        case arrivalMonthTextField:
            viewModel.arrivalMonth = value
        case arrivalDayTextField:
            viewModel.arrivalDay = value
        case departureAirportTextField:
            viewModel.departureAirport = value
        case arrivalAirportTextField:
            viewModel.arrivalAirport = value
        default:
            return true
        }
        return true
    }
}

