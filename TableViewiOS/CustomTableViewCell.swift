//
//  CustomTableViewCell.swift
//  TableViewiOS
//
//  Created by Montserrat Medina on 2023-08-21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var dateField: UILabel!
    @IBOutlet weak var numberField: UILabel!
    @IBOutlet weak var descriptionField: UILabel!
    @IBOutlet weak var amountField: UILabel!
    
    static let identifier = "CustomCell"
    
}
