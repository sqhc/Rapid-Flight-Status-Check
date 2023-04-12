//
//  FlightStatusDataModel.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/11/23.
//

import Foundation

struct FlightStatuses: Codable{
    let data: [FlightStatus]?
    let paging: PageOfData?
}

struct FlightStatus: Codable{
    let flightNumber: Int?
    let flightType: String?
    let departure: DepartureInfo?
    let arrival: ArrivalInfo?
    let segmentInfo: SegmentInfo?
}

struct DepartureInfo: Codable{
    let airport: DepartureAirport?
    let terminal: String?
    let date: String?
    let passengerLocalTime: String?
}

struct DepartureAirport: Codable{
    let iata: String?
}

struct ArrivalInfo: Codable{
    let airport: ArrivalAirport?
    let terminal: String?
    let date: String?
    let passengerLocalTime: String?
}

struct ArrivalAirport: Codable{
    let iata: String?
}

struct SegmentInfo: Codable{
    let numberOfStops: Int?
    let intermediateAirports: IntermediateAirportsInfo?
}

struct IntermediateAirportsInfo: Codable{
    let iata: [IntermediateAirport]?
}

struct IntermediateAirport: Codable{
    let station: String?
}

struct PageOfData: Codable{
    let totalPages: Int?
    let next: String?
}
