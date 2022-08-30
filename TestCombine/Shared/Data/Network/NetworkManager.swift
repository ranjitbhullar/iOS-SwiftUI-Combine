//
//  NetworkManager.swift
//  TestCombine
//
//  Created by Ranjit Singh on 26/08/22.
//

import Foundation
import Combine

//enum APIError: LocalizedError {
//  case invalidRequestError(String)
//}

class NetworkManager {

    var sub: Cancellable? = nil
    
    public func makeNetworkCall() -> AnyPublisher<[FriendDataModel], Error> {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let url = URL(string: "http://ip.jsontest.com")
        
        let url = URL(string: "https://run.mocky.io/v3/ed22f4d0-0ebd-417d-9e08-5e8c0ec631c5")
        
        return URLSession.shared.dataTaskPublisher(for: url!)
            .tryMap( { element -> Data in

                    print("Inside try map block!!")
                    guard let httpResponse = element.response as? HTTPURLResponse,
                        httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                return element.data
                    })
            .decode(type: [FriendDataModel].self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
