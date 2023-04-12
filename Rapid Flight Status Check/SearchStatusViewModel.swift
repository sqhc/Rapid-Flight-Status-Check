//
//  SearchStatusViewModel.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/11/23.
//

import Foundation

protocol SearchStatusVMDelegate: AnyObject{
    func sendDepartureYear()-> String
    func sendDepartureMonth()-> String
    func sendDepartureDay()-> String
    func sendArrivalYear()-> String
    func sendArrivalMonth()-> String
    func sendArrivalDay()-> String
    func sendDepartureAirport()-> String
    func sendArrivalAirport()-> String
}

class SearchStatusViewModel: NSObject, SearchStatusVMDelegate{
    
    var departureYear = ""
    var departureMonth = ""
    var departureDay = ""
    var arrivalYear = ""
    var arrivalMonth = ""
    var arrivalDay = ""
    var departureAirport = ""
    var arrivalAirport = ""
    
    override init() {
        super.init()
    }
    func sendDepartureYear() -> String {
        return departureYear
    }
    
    func sendDepartureMonth() -> String {
        return departureMonth
    }
    
    func sendDepartureDay() -> String {
        return departureDay
    }
    
    func sendArrivalYear() -> String {
        return arrivalYear
    }
    
    func sendArrivalMonth() -> String {
        return arrivalMonth
    }
    
    func sendArrivalDay() -> String {
        return arrivalDay
    }
    
    func sendDepartureAirport() -> String {
        return departureAirport
    }
    
    func sendArrivalAirport() -> String {
        return arrivalAirport
    }
}
