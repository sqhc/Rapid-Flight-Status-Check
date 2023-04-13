//
//  FlightStatusesTableViewModel.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/12/23.
//

import Foundation
import Dispatch

class FlightStatusesTableViewModel: NSObject{
    
    weak var delegate : SearchStatusVMDelegate!
    var manager = APIManager.shared
    
    override init() {
        super.init()
    }
    
    func FormAPI(){
        flightStatusAPI += "&DepartureDate=\(delegate.sendDepartureYear())-\(delegate.sendDepartureMonth())-\(delegate.sendDepartureDay())"
        flightStatusAPI += "&ArrivalDate=\(delegate.sendArrivalYear())-\(delegate.sendArrivalMonth())-\(delegate.sendArrivalDay())"
        let departureAirport = delegate.sendDepartureAirport()
        let arrivalAirport = delegate.sendArrivalAirport()
        if departureAirport != ""{
            flightStatusAPI += "&DepartureAirport=\(departureAirport)"
        }
        if arrivalAirport != ""{
            flightStatusAPI += "&ArrivalAirport=\(arrivalAirport)"
        }
    }
    
    func getStatuses(complete: @escaping (_ errorMessage: String)->()){
        FormAPI()
        DispatchQueue.global(qos: .background).async {[weak self] in
            self?.manager.decodeRequest(url: flightStatusAPI, complete: { success, status, errorMessage in
                if success{
                    let statuses = status
                    self?.fetchStatus(statuses: (statuses?.data)!)
                }
                else{
                    complete(errorMessage!)
                }
            })
        }
    }
    
    var reloadTable: (()->Void)?
    
    var cellModels = [FlightStatusCellModel](){
        didSet{
            reloadTable?()
        }
    }
    
    func fetchStatus(statuses: [FlightStatus]){
        var vms : [FlightStatusCellModel] = []
        for status in statuses {
            vms.append(createCellModel(status: status))
        }
        cellModels.append(contentsOf: vms)
    }
    
    func createCellModel(status: FlightStatus)-> FlightStatusCellModel{
        let departureAirport = status.departure?.airport?.iata
        let arrivalAirport = status.arrival?.airport?.iata
        let departureTerminal = status.departure?.terminal
        let arrivalTerminal = status.arrival?.terminal
        let departureLocalTime = status.departure?.passengerLocalTime
        let arrivalLocalTime = status.arrival?.passengerLocalTime
        let flightNumber = status.flightNumber
        let flightType = status.flightType
        let numberOfStops = status.segmentInfo?.numberOfStops
        let intermediateAirports = status.segmentInfo?.intermediateAirports?.iata
        return FlightStatusCellModel(departureAirport: departureAirport, arrivalAirport: arrivalAirport, departureTerminal: departureTerminal, arrivalTerminal: arrivalTerminal, departureLocalTime: departureLocalTime, arrivalLocalTime: arrivalLocalTime, flightNumber: flightNumber, flightType: flightType, numberOfStops: numberOfStops, intermediateAirports: intermediateAirports)
    }
    
    func getCellModel(indexPath: IndexPath)-> FlightStatusCellModel{
        return cellModels[indexPath.row]
    }
}
