//
//  PlacasTableViewCell.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 4/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import UIKit

class PlacasTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelSubtitulo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
