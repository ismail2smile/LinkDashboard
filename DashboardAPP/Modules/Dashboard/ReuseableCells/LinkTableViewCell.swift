//
//  LinkTableViewCell.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import UIKit
import SDWebImage
class LinkTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var dateLBL: UILabel!
    @IBOutlet weak var clickCountLbl: UILabel!
    @IBOutlet weak var clickTitle: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupFontforLabel()
    }
    
    func setupFontforLabel(){
        titleLBL.setFigFontReqular(size: 14)
        clickCountLbl.setFigFontSemiBold(size: 14)
        
        dateLBL.setFigFontReqular(size: 12)
        clickTitle.setFigFontReqular(size: 12)
        linkLbl.setFigFontReqular(size: 14)
        
    }
    func setDataTocell(item:Link?){
        titleLBL.text = item?.title ?? ""
        dateLBL.text =  Utils.getDateStringFromDate(dateString: item?.created_at ?? "")
        clickCountLbl.text = "\(item?.total_clicks ?? 0)"
        linkLbl.text = item?.web_link ?? ""
        cellImageView.sd_setImage(with: URL(string: item?.original_image ?? ""), placeholderImage: UIImage(named: "placeholder.png"))

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
