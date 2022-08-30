//
//  FriendsDataStore.swift
//  TestCombine
//
//  Created by Ranjit Singh on 26/08/22.
//

import Foundation
import Combine

public final class FriendsDataStore {
    
    var networkManager = NetworkManager()
    
    public func fetchFriendsData() -> AnyPublisher<[FriendDataModel], Error>  {
        return networkManager.makeNetworkCall()
    }
}
