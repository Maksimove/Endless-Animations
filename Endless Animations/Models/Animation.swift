//
//  Animation.swift
//  Endless Animations
//
//  Created by Evgeniy Maksimov on 23.06.2024.
//

struct Animation {
    let precet: [String]
    let curve: [String]

    static func getRandomAnimation() -> Animation {
        let dataStore = DataStore.shared
        
        let animation = Animation(
            precet: dataStore.animation,
            curve: dataStore.curve
        )
        return animation
    }
}

