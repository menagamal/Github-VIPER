//
//  RepoPresenter.swift
//  GithubVIPER
//
//  Created Mena Gamal on 8/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class RepoPresenter: BasePresenter,RepoPresenterProtocol {
    
    weak internal var view: RepoViewProtocol?
    
    var interactor: RepoInteractorInputProtocol?
    
    private let router: RepoRouterProtocol
    
    private var dataSource:RepoCollectionDataSource?
    
    private var dailyPageCount:Int?
    private var weeklyPageCount:Int?
    private var monthlyPageCount:Int?
    
    private var currentTimeFrame:TimeFrame?
    
    
    init(view: RepoViewProtocol, interactor: RepoInteractorInputProtocol?, router: RepoRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        dailyPageCount = 1
        dailyPageCount = 1
        monthlyPageCount = 1
        
    }
    func presenterViewDidLoad() {
        guard let view =  self.view else {
            return
        }
        dataSource = RepoCollectionDataSource(collection: view.repoCollectionView, delegate: self)
    }
    func loadRepos(timeframe:TimeFrame) {
        var date = ""
        
        switch timeframe {
        case .Day:
            date = Date().dateToString(format: DateFormat.get(.yyyy_MM_dd)())
            currentTimeFrame = .Day
            baseView?.showLoadingIndicator()
            self.interactor?.loadRepos(date: date, page: dailyPageCount ?? 1, timeframe: timeframe )
            
            break
        case .Week:
            guard let lastWeekDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: Date()) else {return }
            date = lastWeekDate.dateToString(format: DateFormat.get(.yyyy_MM_dd)())
            currentTimeFrame = .Week
            baseView?.showLoadingIndicator()
            self.interactor?.loadRepos(date: date, page: weeklyPageCount ?? 1, timeframe: timeframe )
            
            break
        case .Month:
            guard let lastMonthDate = Calendar.current.date(byAdding: .month, value: -1, to: Date()) else {return }
            date = lastMonthDate.dateToString(format: DateFormat.get(.yyyy_MM_dd)())
            currentTimeFrame = .Month
            baseView?.showLoadingIndicator()
            self.interactor?.loadRepos(date: date, page: monthlyPageCount ?? 1, timeframe: timeframe )
            break
        }
        
        
    }
    
}

extension RepoPresenter:RepoCollectionDataSourceDelegate{
    func toggleToFavourite(repo: Repos) {
        interactor?.toggleToFavourite(repo: repo)
    }
    
    func didSelected(repo:Repos) {
        self.router.showDetails(with: repo)
    }
    func loadNextPage() {
        var date = ""
        guard let currentTimeFrame = currentTimeFrame else {
            return
        }
        switch currentTimeFrame {
        case .Day:
            date = Date().dateToString(format: DateFormat.get(.yyyy_MM_dd)())
            baseView?.showLoadingIndicator()
            self.interactor?.loadRepos(date: date, page: dailyPageCount ?? 1, timeframe: currentTimeFrame )
            break
        case .Week:
            guard let lastWeekDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: Date()) else {return }
            date = lastWeekDate.dateToString(format: DateFormat.get(.yyyy_MM_dd)())
            baseView?.showLoadingIndicator()
            self.interactor?.loadRepos(date: date, page: weeklyPageCount ?? 1, timeframe: currentTimeFrame )
            break
        case .Month:
            guard let lastMonthDate = Calendar.current.date(byAdding: .month, value: -1, to: Date()) else {return }
            date = lastMonthDate.dateToString(format: DateFormat.get(.yyyy_MM_dd)())
            baseView?.showLoadingIndicator()
            self.interactor?.loadRepos(date: date, page: monthlyPageCount ?? 1, timeframe: currentTimeFrame )
            break
        }
        
    }
}

extension RepoPresenter: RepoInteractorOutputProtocol {
    func didLoadRepos(response: [Repos]) {
        guard let currentTimeFrame = currentTimeFrame else {
            return
        }
        switch currentTimeFrame {
        case .Day:
            dailyPageCount? += 1
            break
        case .Week:
            weeklyPageCount? += 1
            break
        case .Month:
            monthlyPageCount? += 1
            break
        }
        baseView?.hideLoadingIndicator()
        self.presenterViewDidLoad()
        dataSource?.reloadWithData(repos: response)
        DispatchQueue.main.async {
            self.view?.repoCollectionView.setContentOffset(CGPoint(x:0,y:0), animated: true)
        }
    }
    
}


enum TimeFrame {
    case Day,Week,Month
}
