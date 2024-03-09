//
//  HomeViewModel.swift
//  Crypto-app
//
//  Created by Sherif Hamdy on 10/03/2024.
//

import Foundation
import Combine

class HomeViewModel:ObservableObject{
    @Published var allCoins:[CoinModel] = []
    @Published var protfolioCoins:[CoinModel] = []

    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.allCoins.append(DeveloperModel.instance.coin)
            self.protfolioCoins.append(DeveloperModel.instance.coin)
        })
    }
    
}
