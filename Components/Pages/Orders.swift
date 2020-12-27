
//  Created by frimpongOpokuAgyemang on 26/12/2020.
//

import SwiftUI

struct Orders: View {
	
	@ObservedObject var state : HomeViewModel
	@State var show : Bool = false
	@State var showPayment : Bool  = false
	var body: some View {
		ZStack{
			NavigationView{
				VStack{
					if state.totalPrice > 0{
						Button { showPayment.toggle() }label:{
							Text("Total Amount: GHS \(state.totalPrice, specifier:"%.2f")")
								.fontWeight(.bold)
								.multilineTextAlignment(.trailing)
								.padding(15)
								.frame(maxWidth:.infinity)
								.background(Color("my-green"))
								.foregroundColor(.white)
						}
					}else{
						VStack(spacing:10){
							Spacer()
							Image("no-orders")
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(height:250)
							
							Text("You have not made any orders yet")
								.padding(20)
								.foregroundColor(.secondary)
								.font(.caption)
							
						}.onAppear(){
							if( !show ){
								print("I did come here its your animation that is whack")
								self.show.toggle()
							}
						}
						.opacity(show ?1 : 0.3)
						.transition(.scale(scale: show ? 1 : 0.5))
						.animation(Animation.easeInOut(duration: 0.4))
						
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

		.sheet(isPresented: self.$showPayment){
			CheckoutPage(totalAmount:state.totalPrice)
		}
		
	}
}

