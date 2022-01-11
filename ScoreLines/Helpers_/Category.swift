//
//  category.swift
//  Bubble
//
//  Created by Neil Pasricha on 12/28/20.
//  Copyright © 2020 Bubble. All rights reserved.
//

import Foundation
import Combine

class FeedItems: ObservableObject {
   @Published var currentFeed:[View]()
    
    func addSport(sport: String) {
        currentFeed.append(ToggleButton(sport: sport))
    }
}
