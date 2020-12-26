
//  Created by frimpongOpokuAgyemang on 26/12/2020.
//

import SwiftUI

struct HomePage: View {
	var body: some View {
		NavigationView{
			ZStack{
				List(1...8, id:\.self){ _ in
					FoodCard()
				}.listStyle(PlainListStyle())
			}.navigationTitle(" Snack Haven")
		}
	}
}

struct HomePage_Previews: PreviewProvider {
	static var previews: some View {
		HomePage()
	}
}
