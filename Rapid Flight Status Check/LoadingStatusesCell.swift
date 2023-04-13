//
//  LoadingStatusesCell.swift
//  Rapid Flight Status Check
//
//  Created by 沈清昊 on 4/13/23.
//

import UIKit

class LoadingStatusesCell: UITableViewCell {
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
