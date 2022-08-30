//
//  FriendsUsecase.swift
//  TestCombine
//
//  Created by Ranjit Singh on 26/08/22.
//

import Foundation
import Combine

public final class FriendsUsecase {
    
    var repository = FriendsRepository()
    public func fetchFriends() -> AnyPublisher<[FriendsListDomainModel], Error> {
        return repository.fetchFriends()
    }
}
