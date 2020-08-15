//
//  RepoTableViewCell.swift
//  GithubVIPER
//
//  Created by Mena Gamal on 8/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import SDWebImage
class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    func setDetails(repo:Repos) {
        
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        
        labelTitle.textColor = Palette.slateGrey
        labelDesc.textColor = Palette.slateGrey
        
        labelDesc.text = repo.description ?? ""
        labelTitle.text = repo.name ?? ""
        
        //profileImageView.sd_
        if let urlStr = repo.owner?.avatar_url {
            if let url = URL(string: urlStr) {
                profileImageView.sd_setImage(with: url, completed: nil)
            }            
        }
        
        
    }
}
