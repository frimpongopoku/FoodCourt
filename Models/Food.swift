//
//  Food.swift
//  FoodCourt (iOS)
//
//  Created by frimpongOpokuAgyemang on 26/12/2020.
//

struct Food : Decodable, Identifiable {
	let description : String
	let price : Double
	let imageURL : String
	let protein : Int
	let calories : Int
	let id : Int
	let carbs : Int
	let name : String
}
