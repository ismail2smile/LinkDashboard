//
//  MetricCollectionViewCell.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import UIKit

class MetricCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var descLBL: UILabel!
    @IBOutlet weak var iconImbV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupFontforLabel()
    }
    func setupFontforLabel(){
        titleLBL.setFigFontReqular(size: 16)
        descLBL.setFigFontReqular(size: 14)
    }
    func setDatatoCell(itemObj: FlowAnalytic?){
        titleLBL.text = itemObj?.title ?? "--"
        descLBL.text = itemObj?.desc ?? "--"
        iconImbV.image = UIImage(named: itemObj?.imageName ?? "user-25")
    }
}
