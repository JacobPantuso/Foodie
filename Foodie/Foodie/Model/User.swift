//
//  User.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-18.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let username: String
    let fullName: String
    let email: String
    let reviews: Array<Review>
    let followers: Array<String>
    let following: Array<String>
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, username: "test.user", fullName: "Test User", email: "test@gmail.com", reviews: [
        Review(id: 1, place_name: "Amano Kitchen", place_cuisine: "Italian", place_location: "65 Front Street West, Toronto, ON", place_rating: 4.3, review_description: "Lorem ipsum text, you can change this text a later time", review_dine_again: true, review_rating: 4),
        Review(id: 2, place_name: "North of Brooklyn", place_cuisine: "Pizzeria", place_location: "469 Church Street, Toronto, ON", place_rating: 4.3, review_description: "Lorem ipsum text, you can change this text a later time. Lorem ipsum text, you can change this text a later time. Lorem ipsum text, you can change this text a later time", review_dine_again: true, review_rating: 5)
        ], followers: [], following: [])
}
