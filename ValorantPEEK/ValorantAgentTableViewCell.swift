//
//  ValorantAgentTableViewCell.swift
//  ValorantPEEK
//
//  Created by Atharian Rahmadani on 21/09/24.
//

import UIKit

class ValorantAgentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var valorantAgentImageView: UIImageView!
    
    @IBOutlet weak var valorantAgentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
