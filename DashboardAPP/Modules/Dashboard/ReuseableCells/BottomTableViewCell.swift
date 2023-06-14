//
//  BottomTableViewCell.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import UIKit

class BottomTableViewCell: UITableViewCell {

    @IBOutlet weak var viewAllLinkLBL: UILabel!
    @IBOutlet weak var whatsappLbl: UILabel!
    @IBOutlet weak var questionLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupFontforLabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupFontforLabel(){
        viewAllLinkLBL.setFigFontReqular(size: 16)
        whatsappLbl.setFigFontReqular(size: 16)
        questionLBL.setFigFontReqular(size: 16)
    }
    
}
