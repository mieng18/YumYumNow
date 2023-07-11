//
//  Food.swift
//  YumYumNow
//
//  Created by mai nguyen on 7/10/23.
//

import Foundation
struct Food: Identifiable,Equatable,Hashable{
    var id: String = UUID().uuidString
    var imageName: String
    var foodName: String
    var price: String
    var description: String
    var rating: String

}

var foods: [Food] = [
    Food(imageName: "burger_sandwich1", foodName: "Beef Burger", price: "$20",description: "Big juicy beef burger with cheese, lettuce, tomato, onions and special sauce !",rating:"4.5"),
    Food(imageName: "pizza-fries", foodName: "Pizza Fries", price: "$32",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",rating: "4.6")
]

   
