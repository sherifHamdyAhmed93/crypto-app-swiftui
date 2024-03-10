//
//  CoinDataService.swift
//  Crypto-app
//
//  Created by Sherif Hamdy on 10/03/2024.
//

import Foundation
import Combine

class CoinDataService{
    @Published var allCoins:[CoinModel] = []

    var coinSubscription : AnyCancellable?
    init(){
        getData()
    }
    
    func getData(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en") else{
            return
        }
        
        coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300  else{
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] resultCoins in
                self?.allCoins = resultCoins
                self?.coinSubscription?.cancel()
            }

        
    }
    
    
}
