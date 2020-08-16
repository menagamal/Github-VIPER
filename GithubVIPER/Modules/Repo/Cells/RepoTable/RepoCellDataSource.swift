//
//  RepoCellDataSource.swift
//  GithubVIPER
//
//  Created by Mena Gamal on 8/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit

class RepoCellDataSource:  NSObject, UITableViewDataSource,UITableViewDelegate {
    
    weak var delegate: RepoCellDataSourceDelegate!
    
    var tableView: UITableView!
    var repos = [Repos]()
    init(delegate:RepoCellDataSourceDelegate,tableView:UITableView) {
        super.init()

        self.delegate = delegate
        self.tableView = tableView
        self.tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.reloadData()
        
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func reloadWithData(repos:[Repos])  {
        for item in repos {
            self.repos.append(item)
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as! RepoTableViewCell
        cell.selectionStyle = .none
        cell.setDetails(repo: repos[indexPath.row], action: {
            self.delegate.toggleToFavourite(repo: self.repos[indexPath.row])
        })
        if indexPath.row == repos.count - 1 {
            delegate.loadNextPage()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelected(repo: self.repos[indexPath.row])
    }
    
}

protocol RepoCellDataSourceDelegate: class {
    func didSelected(repo:Repos)
    func toggleToFavourite(repo:Repos)
    func loadNextPage()
}

