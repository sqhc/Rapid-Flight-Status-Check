//
//  SearchStatusViewModel.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/11/23.
//

import Foundation

class SearchStatusViewModel: NSObject{
    
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
}
