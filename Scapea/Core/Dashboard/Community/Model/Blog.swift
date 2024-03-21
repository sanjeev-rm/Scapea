//
//  Blog.swift
//  Scapea
//
//  Created by Sanjeev RM on 21/03/24.
//

import Foundation
import SwiftUI

struct Blog {
    
    var image: Image
    var title: String
    var link: String
    var dateCreated: String
}

let SAMPLE_BLOGS = [
    Blog(image: Image(.blog1), title: "The Peace Lily: NASA's Little Air-Purifying Superstar 🌿🚀", link: "https://www.ugaoo.com/blogs/kitchen-gardening/how-to-grow-care-for-a-lemon-plant", dateCreated: "12-10-23"),
    Blog(image: Image(.blog2), title: "My Gardening Experience a tale of generations", link: "https://theaffordableorganicstore.com/gardener-stories/journey-a-gardening-experience/#:~:text=And%20during%20my%20journey%20of,an%20environmentalist%20a%20proud%20thing", dateCreated: "14-12-23"),
    Blog(image: Image(.blog3), title: "When life gives you lemons make a lemonade 🍋", link: "https://www.ugaoo.com/blogs/kitchen-gardening/how-to-grow-care-for-a-lemon-plant", dateCreated: "12-10-23")
]
