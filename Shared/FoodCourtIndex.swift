
//  Created by frimpongOpokuAgyemang on 26/12/2020.
//

import SwiftUI

struct FoodCourtIndex: View {
	@StateObject var homeState : HomeViewModel = HomeViewModel()
    var body: some View {
			TabView{
				HomePage(state: homeState).tabItem {
					Image(systemName: "house")
					Text("Home")
				}
				
				Orders(state: homeState).tabItem {
					Image(systemName: "bag")
					Text("Orders")
				}
				
				Account().tabItem {
					Image(systemName: "person")
					Text("Account")
				}
			}.accentColor(Color("my-green"))
    }
}

struct FoodCourtIndex_Previews: PreviewProvider {
    static var previews: some View {
        FoodCourtIndex()
    }
}
