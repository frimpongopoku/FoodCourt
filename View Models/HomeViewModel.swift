
//  Created by frimpongOpokuAgyemang on 26/12/2020.
//

import Foundation
import SwiftUI
class HomeViewModel : ObservableObject{ // --- This should probably be renamed to a Controller
	let _URL:String = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers";
	@Published var showDetails: Bool = false
	@Published var isLoading : Bool = true
	@Published var foods : [Food] = []
	@Published var selectedFood : Food?
	@Published var orders : [Food] = []
//	@StateObject var cart : Cart = Cart()
	@Published var totalPrice : Double = 0
	@Published var items : [Int:OrderItem] = [:]
	
	//-- Get one order item from cart
	func getItem(with id:Int) -> OrderItem?{
		return items[id];
	}
	
	//--- take out items from the dictionary and put them in an array
	func getItemsInArray() -> [OrderItem]{
		var items:[OrderItem] = [];
		for (_,orderItem) in self.items{
			items.append(orderItem)
		}
		return items;
	}
	
	//-- Increase or decreate total price of the sum of orders in the basket
	func changeAmount(add:Bool, by howMuch:Double){
		if add {
			self.totalPrice += howMuch
		}else{
			self.totalPrice -= howMuch
		}
	}
	
	//-- add food to car and increase the total price
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
	
	//-- Remove food item from cart and reduce the total price
	func removeFromCart(indexInArrayList:Int){
		let items = self.getItemsInArray();
		let currentOrder = items[indexInArrayList]
		self.changeAmount(add: false, by: currentOrder.orderPrice)
		self.items.removeValue(forKey: currentOrder.food.id)
	}
	
	//-- Get all food items from network
	func fetchFood(){
		
		let exp = InternetExplorer.getInstance;
		exp.roamAndFind(link: _URL){
			response in
			DispatchQueue.main.async{
				self.isLoading = false;
				//--- Check for errors in request
				guard response.error == nil else {
					print("ERROR PLEASE: \(String(describing: response.error?.message))")
					// --- Clear the spinner here
					return;
				}
				
				do {
					let decoder = response.decoder;
					let foodRequest =  try decoder.decode(FoodRequest.self, from: response.data!);
					guard foodRequest.request.count != 0 else {
						print("ERROR PLEASE: There is nothing in your food array bro")
						//-- Clear the spinner here
						return ;
					}
					self.foods = foodRequest.request;
//					print("here \(foodRequest.request)")
					
				}
				catch{
					print ("DO-CATCH-ERROR: \(error)")
				}
			}
		}
	}
	
	
	
	
}
