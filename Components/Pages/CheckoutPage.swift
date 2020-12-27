//
//  CheckoutPage.swift
//  FoodCourt (iOS)
//
//  Created by frimpongOpokuAgyemang on 27/12/2020.
//

import SwiftUI

struct CheckoutPage: View {
	
	 var totalAmount = 0.0
    var body: some View {
			VStack{
				Spacer()
				Text("Total amount to be paid")
					.fontWeight(.semibold)
					.font(.title3)
					.padding()
					
				Text("\(totalAmount, specifier:"%.2f")")
					.font(.system(size:70))
					.fontWeight(.light)
					.foregroundColor(Color("my-green"))
				
				Text("GHS")
					.font(.system(.callout))
					.foregroundColor(Color("my-green"))
					.fontWeight(.semibold)
				
				Spacer()
				Button{
					print("Something")
				}label:{
					Text("Pay Now")
						.font(.system(size:30))
						.padding()
						.frame(maxWidth:.infinity)
						.padding([.leading, .trailing],60)
						.foregroundColor(Color("my-green"))
				}
			}
    }
}

struct CheckoutPage_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutPage()
    }
}
