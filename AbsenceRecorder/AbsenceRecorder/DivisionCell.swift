//
//  DivisionCell.swift
//  AbsenceRecorder
//
//  Created by Zack Obied on 08/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class DivisionCell: UITableViewCell {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
        self.selectionStyle = .none
    }
    
}
