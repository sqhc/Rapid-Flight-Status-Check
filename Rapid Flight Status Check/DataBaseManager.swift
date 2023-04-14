//
//  DataBaseManager.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/13/23.
//

import Foundation
import CoreData
import UIKit

class DataBaseManager: NSObject{
    
    static var shared = DataBaseManager()
    var managedContext : NSManagedObjectContext!
    
    override init() {
        super.init()
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        self.managedContext = appdelegate?.persistentContainer.viewContext
    }
    
    func saveSchedule(cellVM: FlightStatusCellModel){
        let entity = NSEntityDescription.entity(forEntityName: "ScheduledFlight", in: self.managedContext)
        let object = NSManagedObject(entity: entity!, insertInto: self.managedContext)
        
        object.setValue(cellVM.departureAirport, forKey: "departureAirport")
        object.setValue(cellVM.arrivalAirport, forKey: "arrivalAirport")
        object.setValue(cellVM.departureDate, forKey: "departureDate")
        object.setValue(cellVM.arrivalDate, forKey: "arrivalDate")
        object.setValue(cellVM.departureLocalTime, forKey: "departureLocalTime")
        object.setValue(cellVM.arrivalLocalTime, forKey: "arrivalLocalTime")
        object.setValue(cellVM.departureTerminal, forKey: "departureTerminal")
        object.setValue(cellVM.arrivalTerminal, forKey: "arrivalTerminal")
        object.setValue(cellVM.flightNumber, forKey: "flightNumber")
        
        do{
            try self.managedContext.save()
        }
        catch{
            print("Error in save new FavoriteFlight: \(String(describing: error))")
        }
    }
    
    func fetchSchedules()-> [ScheduledFlight]{
        let request = NSFetchRequest<ScheduledFlight>(entityName: "ScheduledFlight")
        do{
            let result = try self.managedContext.fetch(request)
            return result
        }
        catch{
            print("Error in fetching FavoriteFlight: \(String(describing: error))")
        }
        return [ScheduledFlight]()
    }
    
    func fetchSpecific(flightNumber: Int)-> ScheduledFlight{
        var schedules = [ScheduledFlight]()
        let request = NSFetchRequest<ScheduledFlight>(entityName: "ScheduledFlight")
        request.predicate = NSPredicate(format: "flightNumber == \(flightNumber)")
        request.fetchLimit = 1
        
        do{
            schedules = try self.managedContext.fetch(request)
        }
        catch{
            print("Error in fetch specific schedule: \(String(describing: error))")
        }
        return schedules[0]
    }
    
    func checkExist(flightNumber: Int)-> Bool{
        var schedules = [ScheduledFlight]()
        let request = NSFetchRequest<ScheduledFlight>(entityName: "ScheduledFlight")
        request.predicate = NSPredicate(format: "flightNumber == \(flightNumber)")
        request.fetchLimit = 1
        
        do{
            schedules = try self.managedContext.fetch(request)
        }
        catch{
            print("Error in fetch specific schedule: \(String(describing: error))")
        }
        return schedules.count == 1
    }
    
    func deleteScedule(object: NSManagedObject){
        self.managedContext.delete(object)
        
        do{
            try self.managedContext.save()
        }
        catch{
            print("Error in delete the schedule: \(String(describing: error))")
        }
    }
}
