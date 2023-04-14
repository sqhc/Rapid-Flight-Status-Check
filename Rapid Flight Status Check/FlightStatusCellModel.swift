//
//  FlightStatusCellModel.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/12/23.
//

import Foundation

struct FlightStatusCellModel{
    let departureAirport: String?
    let arrivalAirport: String?
    let departureTerminal: String?
    let arrivalTerminal: String?
    let departureLocalTime: String?
    let arrivalLocalTime: String?
    let flightNumber: Int?
    let flightType: String?
    let numberOfStops: Int?
    let intermediateAirports: [IntermediateAirport]?
    let departureDate: String?
    let arrivalDate: String?
}
