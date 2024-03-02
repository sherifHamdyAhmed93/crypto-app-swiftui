//
//  HomeView.swift
//  Crypto-app
//
//  Created by Sherif Hamdy on 02/03/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortifoli:Bool = false
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            
            VStack{
                homeHeader
                Spacer()
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

extension HomeView{
    private var homeHeader: some View{
        HStack{
            CircleButtonView(iconName: showPortifoli ? "plus" : "info")
                .animation(.none)
                .background(
                    CircleButtonAnimationView(animate: $showPortifoli)
                )

            Spacer()
            Text(showPortifoli ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)

            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortifoli ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortifoli.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
