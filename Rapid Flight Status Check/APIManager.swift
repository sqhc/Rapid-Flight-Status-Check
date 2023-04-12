//
//  APIManager.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/11/23.
//

import Foundation

class APIManager: NSObject{
    static var shared = APIManager()
    
    override init() {
        super.init()
    }
    
    func decodeRequest(url: String, complete: @escaping (_ success: Bool, _ status: FlightStatuses?, _ errorMessage: String?)->()){
        guard let url = URL(string: url) else{
            complete(false, nil, "The url cannot be formed")
            return
        }
        getData(url: url) {[weak self] success, data, error in
            if success{
                self?.decodeStatusData(data: data!, complete: { success, status, errorMessage in
                    if success{
                        complete(true, status, nil)
                    }
                    else{
                        complete(false, nil, errorMessage)
                    }
                })
            }
            else{
                complete(false, nil, error)
            }
        }
    }
    
    func getData(url: URL, complete: @escaping (_ success: Bool,_ data: Data?,_ error: String?)->()){
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        let task = URLSession.shared.dataTask(with: request) { data, rseponse, error in
            if let error = error {
                complete(false, nil, String(describing: error))
            }
            if let data = data {
                complete(true, data, nil)
            }
            else{
                complete(false, nil, "The GET Request failed, there is no data")
            }
        }
        task.resume()
    }
    
    func decodeStatusData(data: Data, complete: @escaping (_ success: Bool, _ status: FlightStatuses?, _ errorMessage: String?)->()){
        do{
            let decoder = JSONDecoder()
            let status = try decoder.decode(FlightStatuses.self, from: data)
            complete(true, status, nil)
        }
        catch{
            complete(false, nil, String(describing: error))
        }
    }
}
