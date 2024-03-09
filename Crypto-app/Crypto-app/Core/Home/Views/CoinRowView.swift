//
//  CoinRowView.swift
//  Crypto-app
//
//  Created by Sherif Hamdy on 09/03/2024.
//

import SwiftUI

struct CoinRowView: View {
    let coin:CoinModel
    let showHoldingsColumn:Bool
    var body: some View {
        HStack(spacing: 0.0){
            leftColumn
            
            Spacer()
            
            if showHoldingsColumn{
               centerColumn
            }
            
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension CoinRowView{
    private var leftColumn: some View{
        HStack(spacing: 0.0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(width: 30)
            
            Circle()
                .frame(width: 30,height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .padding(.leading,6)
        }
    }
    
    private var centerColumn: some View{
        VStack(alignment: .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2FractionDigits())
                .bold()
                .foregroundColor(Color.theme.accent)
            
            Text((coin.currentHoldings ?? 0).asNumberString())
                .foregroundColor(Color.theme.accent)

        }
    }
    
    private var rightColumn: some View{
        VStack(alignment: .trailing){
            Text(coin.currentPrice.asCurrencyWith2To6FractionDigits())
                .bold()
                .foregroundColor(Color.theme.accent)
            
            Text((coin.priceChangePercentage24h ?? 0).asPercentageString())
                .foregroundColor(
                    (coin.priceChangePercentage24h ?? 0) >= 0 ? Color.green : Color.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5,alignment: .trailing)
    }
}
