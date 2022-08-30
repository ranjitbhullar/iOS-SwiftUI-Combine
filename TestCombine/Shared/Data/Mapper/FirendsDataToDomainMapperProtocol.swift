//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

protocol FriendsDataToDomainMapperProtocol {
    
    func dataToDomainMapper() -> [FriendsListDomainModel]
}
