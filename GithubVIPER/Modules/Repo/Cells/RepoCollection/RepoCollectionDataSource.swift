//
//  RepoCollectionDataSource.swift
//  GithubVIPER
//
//  Created by Mena Gamal on 8/16/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit

class RepoCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    
    var repos = [Repos]()
    var collection:UICollectionView!
    var delegate: RepoCollectionDataSourceDelegate!
    
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,delegate: RepoCollectionDataSourceDelegate) {
        super.init()
        
        
        self.delegate = delegate
        
        self.collection = collection
        
        self.collection.register(UINib(nibName: "RepoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RepoCollectionViewCell")
        
        self.collection.dataSource = self
        
        self.collection.delegate = self
        
        self.collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repos.count
    }
    func reloadWithData(repos:[Repos])  {
        for item in repos {
            self.repos.append(item)
        }
        self.collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RepoCollectionViewCell",for: indexPath) as! RepoCollectionViewCell
        cell.setDetails(repo: repos[indexPath.row], action: {
            self.delegate.toggleToFavourite(repo: self.repos[indexPath.row])
        })
        if indexPath.row == repos.count - 1 {
            delegate.loadNextPage()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelected(repo: self.repos[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let padding: CGFloat = 5
        let height:CGFloat = 93
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize, height: height - padding)
        
    }
   
    
}

protocol RepoCollectionDataSourceDelegate: class {
    func didSelected(repo:Repos)
    func toggleToFavourite(repo:Repos)
    func loadNextPage()
}

