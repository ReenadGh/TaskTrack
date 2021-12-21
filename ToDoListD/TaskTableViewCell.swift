//
//  TaskTableViewCell.swift
//  ToDoListD
//
//  Created by Reenad gh on 15/05/1443 AH.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var declbl: UILabel!
    @IBOutlet weak var titlelbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
