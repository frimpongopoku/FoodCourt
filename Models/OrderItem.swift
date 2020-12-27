//
//  OrderItem.swift
//  FoodCourt (iOS)
//
//  Created by frimpongOpokuAgyemang on 26/12/2020.
//

import Foundation

struct OrderItem : Identifiable{
	var food : Food
	var id : Int {
		return self.food.id
	}
	var howMany : Int = 1
	
	var orderPrice:Double {
		return Double(self.howMany) * self.food.price
	}
	
	
	mutating func increase(by howMuch: Int){
		self.howMany += howMuch
	}
}
