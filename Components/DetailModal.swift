
//  Created by frimpongOpokuAgyemang on 25/12/2020.
//

import SwiftUI

struct DetailModal: View {
	@ObservedObject var state : HomeViewModel
	
	var body: some View {
		VStack{
			ImageFromNetwork(link:state.selectedFood?.imageURL ?? "")
				.frame(height:200)
				.overlay(
					XDismiss(state:state)
						.padding(5),
					alignment: .topTrailing)
			
			
			
			VStack(alignment:.center){
				Text(state.selectedFood?.name ?? "Test Food")
					.fontWeight(.semibold)
					.padding(.bottom, 20)
					.font(.title)
				Text(state.selectedFood?.description ?? "Some description of the food, neatly written here.\nAnd then some other stuff")
					.multilineTextAlignment(.center)
					.font(.body)
					.foregroundColor(.secondary)
					.padding(.all, 25)
				HStack(spacing:25){
					VStack(alignment:.center,spacing:3){
						Text("Calories")
							.foregroundColor(.secondary)
							.fontWeight(.medium)
						
						Text("\(state.selectedFood?.calories ?? 0)")
							.foregroundColor(.secondary)
					}
					VStack(alignment:.center,spacing:3){
						Text("Carbs")
							.foregroundColor(.secondary)
							.fontWeight(.medium)
						
						
						Text("\(state.selectedFood?.carbs ?? 0)g")
							.foregroundColor(.secondary)
					}
					VStack(alignment:.center,spacing:3){
						Text("Protein")
							.foregroundColor(.secondary)
							.fontWeight(.medium)
						
						Text("\(state.selectedFood?.protein ?? 0)g")
							.foregroundColor(.secondary)
					}
				}
				Spacer()
				Button{
					print("We dey we dey and so what?")
				}label:{
					Text("Add To Order")
						.padding()
						.padding([.leading, .trailing], 60)
						.background(Color("my-green"))
						.cornerRadius(8)
						.foregroundColor(.white)
					
					
				}
				Spacer()
			}
			Spacer()
			
		}
		.frame(width:320, height: 525)
		.background(Color(.systemBackground))
		.cornerRadius(10)
		.padding(.leading, 40)
		.padding(.trailing, 40)
		.shadow(radius:12 )
		
		
		
		
	}
}

//struct DetailModal_Previews: PreviewProvider {
//    static var previews: some View {
//			DetailModal(toggleDetails: .constant(false))
//    }
//}
