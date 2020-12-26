
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
