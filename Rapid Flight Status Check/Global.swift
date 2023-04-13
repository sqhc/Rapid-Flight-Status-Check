//
//  Global.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/11/23.
//

import Foundation

var flightStatusAPI = "https://flight-info-api.p.rapidapi.com/status?version=v1"

let headers = [
    "X-RapidAPI-Key": "54217155a0mshc59ae06a0968327p12a4c1jsn682bd9007ac0",
    "X-RapidAPI-Host": "flight-info-api.p.rapidapi.com"
]

var statusesCache = NSCache<NSNumber, NSData>()
