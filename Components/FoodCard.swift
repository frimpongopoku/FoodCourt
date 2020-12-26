//
//  FoodCard.swift
//  CustomSwiftViews (iOS)
//
//  Created by frimpongOpokuAgyemang on 25/12/2020.
//

import SwiftUI

struct FoodCard: View {
	var food : Food?
	var body: some View {
		HStack(spacing:15){
			ImageFromNetwork(link: food?.imageURL ?? "")
				.aspectRatio(contentMode: .fit)
				.cornerRadius(10)
				.frame(width: 100, height: 80)
				
			VStack(alignment:.leading, spacing:6){
				Text(food?.name	 ?? "...")
					.font(.title2)
					.fontWeight(.medium)
				HStack{
					
					Text("GHS \(food?.price ?? 0, specifier: "%.2f")")
						.font(.subheadline)
						.fontWeight(.semibold)
						.foregroundColor(.secondary)
					
					Spacer()
					
//					Text("35")
//						.font(.caption)
//						.fontWeight(.semibold)
//						.padding(.leading,6)
//						.padding(.trailing, 6)
//						.padding([.top,.bottom],4)
//						.background(Color("my-green"))
//						.cornerRadius(5555)
//						.foregroundColor(.white)
//						.padding(.bottom,10)
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
