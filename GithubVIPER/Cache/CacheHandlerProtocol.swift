//
//  CacheHandlerProtocol.swift
//  GithubVIPER
//
//  Created by Mena Gamal on 8/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

protocol CacheHandlerProtocol {
    func SaveData(object:Repos) -> CacheResponse
    func loadAllCachedData() -> [Repos]
    func deleteObject(object:Repos) -> CacheResponse
    func fetchObject(with id:Int) -> Repos?
    func clearAll()
}
