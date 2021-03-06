
//  Created by frimpongOpokuAgyemang on 26/12/2020.
//

import SwiftUI

struct HomePage: View {
	@ObservedObject var state : HomeViewModel
	@State var animateModal : Bool = false
	var body: some View {
		
		ZStack{
			if !state.isLoading{
				NavigationView{
					List(state.foods){ food in
						Button{
							state.showDetails.toggle()
							self.animateModal.toggle()
							state.selectedFood = food;
						}label:{
							FoodCard(state:state, relatedOrder: state.getItem(with: food.id), food: food )
						
						}
					}.listStyle(PlainListStyle())
					.navigationTitle("Snack Haven")
					.disabled(state.showDetails)
					
				}
				.blur(radius: state.showDetails ? 10: 0)
				
				
				if state.showDetails {
					DetailModal(state: state)
						
				}
			}
			else {
				SpinnerView()
			}
		}	.onAppear(){
			state.fetchFood()
		}
	}
}

//struct HomePage_Previews: PreviewProvider {
//	static var previews: some View {
//		HomePage(homeState: HomeViewModel)
//	}
//}
