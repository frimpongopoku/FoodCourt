//
//  FoodCard.swift
//  CustomSwiftViews (iOS)
//
//  Created by frimpongOpokuAgyemang on 25/12/2020.
//

import SwiftUI

struct FoodCard: View {
    var body: some View {
        HStack(spacing:5){
            
            Image("no-food")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 80)
                .cornerRadius(10)
            
            VStack(alignment:.leading, spacing:6){
                Text("Test Snack")
                    .font(.title2)
                    .fontWeight(.medium)
                HStack{
                    
                    Text("GHS 40")
											.font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("35")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .padding(.leading,6)
                        .padding(.trailing, 6)
                        .padding([.top,.bottom],4)
                        .background(Color("my-green"))
                        .cornerRadius(5555)
                        .foregroundColor(.white)
//                        .padding([.trailing], 12)
                        .padding(.bottom,10)
                }
            }.padding(.trailing,10)
            
        }
    }
}

struct FoodCard_Previews: PreviewProvider {
    static var previews: some View {
        FoodCard()
    }
}
