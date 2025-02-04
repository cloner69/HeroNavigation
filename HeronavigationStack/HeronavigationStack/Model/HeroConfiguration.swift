//
//  HeroConfiguration.swift
//  HeronavigationStack
//
//  Created by Adrian Suryo Abiyoga on 23/01/25.
//

import SwiftUI

struct HeroConfiguration {
    var layer: String?
    var coordinates: (CGRect, CGRect) = (.zero, .zero)
    var isExpandedCompletely: Bool = false
    var activeID: String = ""
}
