//
//  BaseClass.swift
//
//  Created by Sherif Hamdy on 09/03/2024
//  Copyright (c) . All rights reserved.
//

import Foundation

// https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en


struct CoinModel: Codable,Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case atlDate = "atl_date"
        case totalSupply = "total_supply"
        case low24h = "low_24h"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case image
        case name
        case currentPrice = "current_price"
        case id
        case lastUpdated = "last_updated"
        case circulatingSupply = "circulating_supply"
        case maxSupply = "max_supply"
        case totalVolume = "total_volume"
        case marketCap = "market_cap"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case atlChangePercentage = "atl_change_percentage"
        case marketCapChangePercentage24h = "market_cap_change_percentage_24h"
        case marketCapChange24h = "market_cap_change_24h"
        case atl
        case marketCapRank = "market_cap_rank"
        case priceChange24h = "price_change_24h"
        case high24h = "high_24h"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case symbol
        case sparklineIn7d = "sparkline_in_7d"

    }
    
    var id,symbol,name: String
    var image: String
    var currentPrice: Double
    
    var atlDate: String?
    var totalSupply: Double?
    var low24h: Double?
    var fullyDilutedValuation: Int?
    var lastUpdated: String?
    var circulatingSupply: Double?
    var maxSupply: Double?
    var totalVolume: Int?
    var marketCap: Int?
    var priceChangePercentage24h: Double?
    var atlChangePercentage: Double?
    var marketCapChangePercentage24h: Double?
    var marketCapChange24h: Double?
    var atl: Double?
    var marketCapRank: Int?
    var priceChange24h: Double?
    var high24h: Double?
    var ath: Double?
    var athChangePercentage: Float?
    var athDate: String?
    var sparklineIn7d: SparklineIn7d?

    var currentHoldings:Double?
    
    func updateHoldings(amount:Double)->CoinModel{
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, atlDate: atlDate, totalSupply: totalSupply, low24h: low24h, fullyDilutedValuation: fullyDilutedValuation, lastUpdated: lastUpdated, circulatingSupply: circulatingSupply, maxSupply: maxSupply, totalVolume: totalVolume, marketCap: marketCap, priceChangePercentage24h: priceChangePercentage24h, atlChangePercentage: atlChangePercentage, marketCapChangePercentage24h: marketCapChangePercentage24h, marketCapChange24h: marketCapChange24h, atl: atl, marketCapRank: marketCapRank, priceChange24h: priceChange24h, high24h: high24h, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate,currentHoldings: amount)
    }
    
    var currentHoldingsValue:Double{
        return currentPrice * (currentHoldings ?? 0)
    }
    
    var rank:Int{
        return marketCapRank ?? 0
    }
    
    
    
}

struct SparklineIn7d: Codable {

  enum CodingKeys: String, CodingKey {
    case price
  }

  var price: [Float]?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    price = try container.decodeIfPresent([Float].self, forKey: .price)
  }

}
