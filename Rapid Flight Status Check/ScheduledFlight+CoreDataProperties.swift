//
//  ScheduledFlight+CoreDataProperties.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/13/23.
//
//

import Foundation
import CoreData


extension ScheduledFlight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScheduledFlight> {
        return NSFetchRequest<ScheduledFlight>(entityName: "ScheduledFlight")
    }

    @NSManaged public var departureAirport: String?
    @NSManaged public var arrivalAirport: String?
    @NSManaged public var flightNumber: Int64
    @NSManaged public var departureDate: String?
    @NSManaged public var departureLocalTime: String?
    @NSManaged public var arrivalDate: String?
    @NSManaged public var arrivalLocalTime: String?
    @NSManaged public var departureTerminal: String?
    @NSManaged public var arrivalTerminal: String?

}

extension ScheduledFlight : Identifiable {

}
