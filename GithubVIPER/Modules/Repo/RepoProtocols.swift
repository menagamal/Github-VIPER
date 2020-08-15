//
//  RepoProtocols.swift
//  GithubVIPER
//
//  Created Mena Gamal on 8/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation
import UIKit

//MARK: View -
protocol RepoViewProtocol: class {
    var presenter: RepoPresenterProtocol?  { get set }
    var repoTableView: UITableView!  { get set }
}
//MARK: Presenter -
protocol RepoPresenterProtocol: class {
    var view: RepoViewProtocol?  { get set }
    func loadRepos(timeframe:TimeFrame)
    func presenterViewDidLoad()  
}

//MARK: Interactor -
protocol RepoInteractorOutputProtocol: class {
    func didLoadRepos(response:[Repos])
    
}
protocol RepoInteractorInputProtocol: class {
    var presenter: RepoInteractorOutputProtocol?  { get set }
    func loadRepos (date:String,page:Int,timeframe:TimeFrame)
}

//MARK: Router -
protocol RepoRouterProtocol: class {
    var view: UIViewController! { get set }
    
}
