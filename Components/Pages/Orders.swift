
//  Created by frimpongOpokuAgyemang on 26/12/2020.
//

import SwiftUI

struct Orders: View {
	
	@ObservedObject var state : HomeViewModel
	var body: some View {
		ZStack{
			NavigationView{
				VStack{
					if state.totalPrice > 0{
						Text("Total Amount: GHS \(state.totalPrice, specifier:"%.2f")")
							.fontWeight(.bold)
							.multilineTextAlignment(.trailing)
							.padding(15)
							.frame(maxWidth:.infinity)
							.background(Color("my-green"))
							.foregroundColor(.white)
					}else{
						VStack(spacing:10){
							Spacer()
							Image("no-orders")
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(height:250)
							Text("You have not made any orders yet")
								.foregroundColor(.secondary)
								.font(.caption)
						}
					}
					
					List{
						ForEach(state.getItemsInArray()){
							order in
							FoodCard(state: state, relatedOrder:order, food: order.food)
						}
						.onDelete(perform: { indexSet in
							for index in indexSet{
								state.removeFromCart(indexInArrayList: index)
							}
						})
					}.listStyle(PlainListStyle())
					.navigationTitle("Orders")
					
				}
			}
		}
		
	}
}

//struct Orders_Previews: PreviewProvider {
//    static var previews: some View {
//        Orders()
//    }
//}
