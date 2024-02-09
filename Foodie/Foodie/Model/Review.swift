//
//  Review.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-30.
//

import Foundation

struct Review: Identifiable, Codable {
    let id: Int
    let place_name: String
    let place_cuisine: String
    let place_location: String
    let place_rating: Float
    let review_description: String
    let review_dine_again: Bool
    let review_rating: Int
}

extension Review {
    static var MOCK_REVIEW = Review(id: 1, place_name: "Amano Kitchen", place_cuisine: "Italian", place_location: "65 Front Street West, Toronto, ON", place_rating: 4.3, review_description: "Lorem ipsum text, you can change this text a later time", review_dine_again: true, review_rating: 4)
}
