//
//  ScheduledFlightsTableViewModel.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/13/23.
//

import Foundation
import Dispatch

class ScheduledFlightsTableViewModel: NSObject{
    
    var manager = DataBaseManager.shared
    
    override init() {
        super.init()
    }
    
    func getSchedules(){
        DispatchQueue.global(qos: .background).async {[weak self] in
            let schedules = self!.manager.fetchSchedules()
            self?.fetchSchedule(schedules: schedules)
        }
    }
    
    var reloadTable: (()->Void)?
    
    var cellModels = [ScheduledFlightCellModel]() {
        didSet{
            reloadTable?()
        }
    }
    
    func fetchSchedule(schedules: [ScheduledFlight]){
        var vms = [ScheduledFlightCellModel]()
        for schedule in schedules {
            vms.append(createCellModel(schedule: schedule))
        }
        cellModels = vms
    }
    
    func createCellModel(schedule: ScheduledFlight)-> ScheduledFlightCellModel{
        let departureAirport = schedule.departureAirport
        let arrivalAirport = schedule.arrivalAirport
        let departureTerminal = schedule.departureTerminal
        let arrivalTerminal = schedule.arrivalTerminal
        let departureLocalTime = schedule.departureLocalTime
        let arrivalLocalTime = schedule.arrivalLocalTime
        let departureDate = schedule.departureDate
        let arrivalDate = schedule.arrivalDate
        let flightNumber = schedule.flightNumber
        return ScheduledFlightCellModel(departureAirport: departureAirport, arrivalAirport: arrivalAirport, departureTerminal: departureTerminal, arrivalTerminal: arrivalTerminal, departureLocalTime: departureLocalTime, arrivalLocalTime: arrivalLocalTime, departureDate: departureDate, arrivalDate: arrivalDate, flightNumber: Int(flightNumber))
    }
    
    func getCellModel(indexPath: IndexPath)-> ScheduledFlightCellModel{
        return cellModels[indexPath.row]
    }
    
    func deleteSchedule(indexPath: IndexPath){
        let cellVM = cellModels[indexPath.row]
        let object = manager.fetchSpecific(flightNumber: cellVM.flightNumber!)
        manager.deleteScedule(object: object)
    }
}
