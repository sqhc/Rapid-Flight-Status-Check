//
//  ScheduledFlightCell.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/13/23.
//

import UIKit

class ScheduledFlightCell: UITableViewCell {
    @IBOutlet weak var departureAirportLabel: UILabel!
    @IBOutlet weak var arrivalAirportLabel: UILabel!
    @IBOutlet weak var departureTerminalLabel: UILabel!
    @IBOutlet weak var arrivalTerminalLabel: UILabel!
    @IBOutlet weak var flightNumberLabel: UILabel!
    @IBOutlet weak var departureDateLabel: UILabel!
    @IBOutlet weak var departureLocalTimeLabel: UILabel!
    @IBOutlet weak var arrivalDateLabel: UILabel!
    @IBOutlet weak var arrivalLocalTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
