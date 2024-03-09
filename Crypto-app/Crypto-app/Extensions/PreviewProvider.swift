//
//  PreviewProvider.swift
//  Crypto-app
//
//  Created by Sherif Hamdy on 09/03/2024.
//

import SwiftUI

extension PreviewProvider{
    static var dev:DeveloperModel{
        return DeveloperModel.instance
    }
}

class DeveloperModel{
    static let instance:DeveloperModel = DeveloperModel()
    
    private init(){}
    
    let homeVM = HomeViewModel()
    
    let coin = CoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image:  "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 68158, atlDate: "2024-03-08T20:05:03.481Z", totalSupply: 21000000, low24h: 66610, fullyDilutedValuation: 1433514105538, lastUpdated: "2024-03-09T01:05:56.158Z", circulatingSupply: 19648843, maxSupply: 21000000, totalVolume: 62315206973, marketCap: 1341280647524, priceChangePercentage24h: 1.3093, atlChangePercentage: -1.67347, marketCapChangePercentage24h: 1.61984, marketCapChange24h: 21380212361, atl: 67.81, marketCapRank: 1, priceChange24h: 880.86, high24h: 69428, ath: 69428, athChangePercentage: 100573.76172, athDate: "2013-07-06T00:00:00.000Z", currentHoldings: 1.5)
}

