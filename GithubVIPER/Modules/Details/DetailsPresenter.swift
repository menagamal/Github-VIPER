//
//  DetailsPresenter.swift
//  GithubVIPER
//
//  Created Mena Gamal on 8/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DetailsPresenter: BasePresenter,DetailsPresenterProtocol {

    weak internal var view: DetailsViewProtocol?
    var interactor: DetailsInteractorInputProtocol?
    
    private let router: DetailsRouterProtocol
    
    init(view: DetailsViewProtocol, interactor: DetailsInteractorInputProtocol?, router: DetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func loadLayout() {
        interactor?.fetchDetails()
    }
    func openInGithub() {
        self.router.openInGithub(url: interactor?.repoUrl() ?? "")
    }
}

extension DetailsPresenter: DetailsInteractorOutputProtocol {
    func didLoadRepo(repo: Repos) {
        guard let view = view else {
            return
        }
        view.labelTitle.text = repo.descriptionStr ?? ""
        view.labelLanguage.text = repo.language ?? ""
        view.labelRate.text = "\(repo.score ?? 0 ) Stars"
        view.labelFork.text = "\(repo.forks_count ?? 0 ) Stars"
        view.labelCreateAt.text = repo.created_at ?? ""
        view.loadTitle(str: repo.name ?? "" )
    }
    
    
}
