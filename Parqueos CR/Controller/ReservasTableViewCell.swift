//
//  ReservasTableViewCell.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 6/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import UIKit

class ReservasTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitleReserva: UILabel!
    @IBOutlet weak var labelSubtitleReserva: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
