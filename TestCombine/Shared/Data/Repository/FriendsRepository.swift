//
//  FriendsRepository.swift
//  TestCombine
//
//  Created by Ranjit Singh on 26/08/22.
//

import Foundation
import Combine


public final class FriendsRepository {
    
    var dataStore = FriendsDataStore()
    
    public func fetchFriends() -> AnyPublisher<[FriendsListDomainModel], Error>  {
        
        return dataStore.fetchFriendsData()
            .map({ dataModel in
                print("Repository - Inside the map: ")
                print(dataModel)
                let mapper = FriendsDataToDomainMapper(dataModel: dataModel)
                return mapper.dataToDomainMapper()
            })
            .eraseToAnyPublisher()
    }
}
