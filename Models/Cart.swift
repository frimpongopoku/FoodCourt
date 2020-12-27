
//  Created by frimpongOpokuAgyemang on 26/12/2020.
//

import Foundation

class Cart  : ObservableObject{
	var items : [Int:OrderItem] = [:]
	var totalPrice : Double = 0
	func getItem(with id:Int) -> OrderItem?{
		return items[id];
	}
	
	// --- take out items from the dictionary and put them in an array
	func getItemsInArray() -> [OrderItem]{
		var items:[OrderItem] = [];
		for (_,orderItem) in self.items{
			items.append(orderItem)
		}
		return items;
	}
	
	// -- Increase or decreate total price of the sum of orders in the basket
	func changeAmount(add:Bool, by howMuch:Double){
		if add {
			self.totalPrice += howMuch
		}else{
			self.totalPrice -= howMuch
		}
		print("I am the new price \(self.totalPrice)")
	}
	
	func addToCart( food: Food){
		var found = self.getItem(with: food.id);
		let order : OrderItem
		self.changeAmount(add: true, by: food.price)
		
		guard  found != nil  else {
			order = OrderItem(food:food)
			self.items.updateValue(order, forKey: food.id)
			return;
		}
		
		found?.increase(by: 1);
		self.items.updateValue(found!, forKey: food.id)
		
	}
	
	func removeFromCart(which food:Food){
		self.changeAmount(add: false, by: food.price)
		self.items.removeValue(forKey: food.id)
	}
	
}
