//
//  ChampViewCell.swift
//  DynamiqueForm
//
//  Created by Developer on 24/03/2017.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class ChampViewCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
