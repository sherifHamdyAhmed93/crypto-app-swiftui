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
    
    private var dataService = CoinDataService()
    
    private var cancenables = Set<AnyCancellable>()

    init(){
       addAllCoinsSubscription()
    }
    
    func addAllCoinsSubscription(){
        dataService.$allCoins
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancenables)
    }
    
}
