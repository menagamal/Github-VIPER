//
//  FavouriteViewController.swift
//  GithubVIPER
//
//  Created Mena Gamal on 8/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class FavouriteViewController: BaseViewController, FavouriteViewProtocol {

	var presenter: FavouritePresenterProtocol?

    @IBOutlet weak var favTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadAllFavItems()
    }

}
