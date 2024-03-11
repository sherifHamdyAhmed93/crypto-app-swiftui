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
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion(completion:), receiveValue: { [weak self] resultCoins in
                self?.allCoins = resultCoins
                self?.coinSubscription?.cancel()
            })
    }
    
    
}
