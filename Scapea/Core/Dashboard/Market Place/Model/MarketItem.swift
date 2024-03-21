//
//  MarketItem.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import Foundation
import SwiftUI

enum MarketItemType: String {
    case plant = "Plants"
    case devices = "IOT Devices"
    case tools = "Tools"
    case fertilizers = "Fertilizers"
}

struct MarketItem {
    
    var type: MarketItemType
    var image: Image
    var title: String
    var description: String
}

let SAMPLE_ITEMS = [
    
    MarketItem(type: .plant, image: Image(.plant1), title: "Tulip", description: "Tulips are perennial herbs with cup-shaped flowers that bloom in the spring. They are grown as potted plants and cut flowers. Tulips can be planted individually or in groups of seven or more. For best results, plant the bulbs in rectangular, triangular, or oval patterns so the flowers are visible from all angles."),
    MarketItem(type: .plant, image: Image(.plant2), title: "Snake plant", description: "Tulips are perennial herbs with cup-shaped flowers that bloom in the spring. They are grown as potted plants and cut flowers. Tulips can be planted individually or in groups of seven or more. For best results, plant the bulbs in rectangular, triangular, or oval patterns so the flowers are visible from all angles."),
    MarketItem(type: .plant, image: Image(.plant3), title: "Aloe vera", description: "Tulips are perennial herbs with cup-shaped flowers that bloom in the spring. They are grown as potted plants and cut flowers. Tulips can be planted individually or in groups of seven or more. For best results, plant the bulbs in rectangular, triangular, or oval patterns so the flowers are visible from all angles."),
    MarketItem(type: .plant, image: Image(.plant4), title: "Bougainvillea", description: "Tulips are perennial herbs with cup-shaped flowers that bloom in the spring. They are grown as potted plants and cut flowers. Tulips can be planted individually or in groups of seven or more. For best results, plant the bulbs in rectangular, triangular, or oval patterns so the flowers are visible from all angles.")]
