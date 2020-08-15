//
//  SearchPresenter.swift
//  GithubVIPER
//
//  Created Mena Gamal on 8/16/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SearchPresenter: BasePresenter,SearchPresenterProtocol {
    
    weak internal var view: SearchViewProtocol?
    
    var interactor: SearchInteractorInputProtocol?
    
    private let router: SearchRouterProtocol
    
    private var page = 1
    
    private var currentSearchQuery = ""
    
    private var dataSource:RepoCellDataSource?
    
    init(view: SearchViewProtocol, interactor: SearchInteractorInputProtocol?, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func searchRepos(str: String) {
        page = 1
        currentSearchQuery = str
        self.interactor?.searchRepos(str: str, page: page)
    }
    
    func clearTable() {
        guard let view =  self.view else {
            return
        }
        dataSource?.repos.removeAll()   
        dataSource = RepoCellDataSource(delegate: self, tableView: view.searchTable)
        
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    func didload(repos: [Repos]) {
        guard let view =  self.view else {
            return
        }
        dataSource = RepoCellDataSource(delegate: self, tableView: view.searchTable)
        dataSource?.reloadWithData(repos: repos)
    }
}

extension SearchPresenter:RepoCellDataSourceDelegate {
    func didSelected(repo: Repos) {
        self.router.showDetails(with: repo)
    }
    
    func toggleToFavourite(repo: Repos) {
        interactor?.toggleToFavourite(repo: repo)
    }
    
    func loadNextPage() {
        page += 1
        self.interactor?.searchRepos(str: currentSearchQuery, page: page)
    }
    
    
}
