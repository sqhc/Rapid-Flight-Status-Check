//
//  FlightStatusCell.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/12/23.
//

import UIKit

class FlightStatusCell: UITableViewCell {
    @IBOutlet weak var departureAirportLabel: UILabel!
    @IBOutlet weak var arrivalAirportLabel: UILabel!
    @IBOutlet weak var departureTerminalLabel: UILabel!
    @IBOutlet weak var arrivalTerminalLabel: UILabel!
    @IBOutlet weak var departureLocalTimeLabel: UILabel!
    @IBOutlet weak var arrivalLocalTimeLabel: UILabel!
    @IBOutlet weak var flightNumberLabel: UILabel!
    @IBOutlet weak var flightTypeLabel: UILabel!
    @IBOutlet weak var numberOfStopsLabel: UILabel!
    @IBOutlet weak var intermediateAirportsTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var cellModel: FlightStatusCellModel?{
        didSet{
            departureAirportLabel.text = cellModel?.departureAirport ?? "Unknown"
            arrivalAirportLabel.text = cellModel?.arrivalAirport ?? "Unknown"
            departureTerminalLabel.text = cellModel?.departureTerminal ?? "Unknown"
            arrivalTerminalLabel.text = cellModel?.arrivalTerminal ?? "Unknown"
            departureLocalTimeLabel.text = cellModel?.departureLocalTime ?? "Unknown"
            arrivalLocalTimeLabel.text = cellModel?.arrivalLocalTime ?? "Unknwon"
            flightNumberLabel.text = "\(cellModel?.flightNumber ?? 0)"
            flightTypeLabel.text = cellModel?.flightType ?? "Unknwon"
            numberOfStopsLabel.text = "\(cellModel?.numberOfStops ?? 0)"
            if let intermediateAirports = cellModel?.intermediateAirports{
                for (index, intermediateAirport) in intermediateAirports.enumerated() {
                    if index == intermediateAirports.count - 1{
                        intermediateAirportsTextView.text.append(contentsOf: intermediateAirport.station ?? "Unknown")
                    }
                    else{
                        intermediateAirportsTextView.text.append(contentsOf: "\(intermediateAirport.station ?? "Unknown"), ")
                    }
                }
            }
        }
    }
}
