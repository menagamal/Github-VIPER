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
    
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    private let unfavImage = UIImage(named: "unfav")
    private let favImage = UIImage(named: "fav")
    private var action:(()->Void)? = nil
    private var id = 0
    private var isFav = false
    func setDetails(repo:Repos,action:@escaping (()->Void)) {
        
        self.action = action
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        
        labelTitle.textColor = Palette.slateGrey
        labelDesc.textColor = Palette.slateGrey
        
        labelDesc.text = repo.descriptionStr ?? ""
        labelTitle.text = repo.name ?? ""
        
        if let base64 = repo.owner?.base64 , !base64.isEmpty {
            let dataDecoded : Data = Data(base64Encoded: base64, options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            profileImageView.image  = decodedimage
        } else {
            if let urlStr = repo.owner?.avatar_url {
                if let url = URL(string: urlStr) {
                    profileImageView.sd_setImage(with: url) { (img, error, _, _) in
                        if error == nil {
                            let imageData:Data = img!.pngData()!
                            let strBase64:String = imageData.base64EncodedString(options: .lineLength64Characters)
                            repo.owner?.base64 = strBase64
                        }
                    }
                }
            }
        }
        guard let id = repo.id else {
            return
        }
        self.id = id
        if CacheHandler.ids.contains(id) {
            isFav = true
            btnFav.setImage(favImage, for: .normal)
        } else {
            isFav = false
            btnFav.setImage(unfavImage, for: .normal)
        }
        
    }
    
    @IBAction func toggleFav(_ sender: Any) {
        (action ?? {})()
        if isFav {
            isFav = false
            btnFav.setImage(unfavImage, for: .normal)
        } else {
            isFav = true
            btnFav.setImage(favImage, for: .normal)
        }
    }
    
}
