//
//  CircleButtonAnimationView.swift
//  Crypto-app
//
//  Created by Sherif Hamdy on 03/03/2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate:Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none,value: animate)
//            .onAppear{
//                animate.toggle()
//            }
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(true))
//            .foregroundColor(.red)
//            .frame(width: 100,height: 100)
    }
}
