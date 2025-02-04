//
//  Profile.swift
//  HeronavigationStack
//
//  Created by Adrian Suryo Abiyoga on 23/01/25.
//

import SwiftUI

struct Profile: Identifiable, Hashable {
    var id = UUID().uuidString
    var userName: String
    var profilePicture: String
    var lastMsg: String
}

/// Sample Profile Data
var profiles = [
    Profile(userName: "Jennie", profilePicture: "Pic1", lastMsg: "Hi Kavsoft !!!"),
    Profile(userName: "Erica", profilePicture: "Pic2", lastMsg: "Nothing!"),
    Profile(userName: "Emily", profilePicture: "Pic3", lastMsg: "Binge Watching 😌"),
    Profile(userName: "Julie", profilePicture: "Pic4", lastMsg: "404 Page not Found 🥲"),
    Profile(userName: "Kaviya", profilePicture: "Pic5", lastMsg: "Do not Disturb.")
]
