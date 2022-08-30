//
//  FriendsViewModel.swift
//  TestCombine
//
//  Created by Ranjit Singh on 26/08/22.
//

import Foundation
import Combine

public final class FriendsListViewModel: ObservableObject {
    
    @Published public var friends = [FriendsListDomainModel]()
    private var sub: Cancellable? = nil
    
    var usecase = FriendsUsecase()
    
    public func fetchFriends() {
        sub = usecase.fetchFriends().sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished!!")
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                }
            },
            receiveValue: { response in
                print("Received!!")
                DispatchQueue.main.async {
                    self.friends = response
                }
            }
        )
    }
}
