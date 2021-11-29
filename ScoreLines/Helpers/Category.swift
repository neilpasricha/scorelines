//
//  category.swift
//  Bubble
//
//  Created by Neil Pasricha on 12/28/20.
//  Copyright © 2020 Bubble. All rights reserved.
//

import Foundation
import Combine

class Category: ObservableObject {
    var category_clicked:[Int] {
        willSet {
            objectWillChange.send()
        }
    }
    
    var fetching:Bool {
        willSet {
            objectWillChange.send()
        }
    }
    let objectWillChange = ObservableObjectPublisher()
    
    let cat_icons = ["dealsf1", "hhf1", "recf1", "whf1", "miscf1"]
    let categories = ["Deals", "Happy Hour", "Recreation", "What's Happening?", "Misc"]
    let categoriesMap = ["Deals":1, "Happy Hour":2, "Recreation":3, "What's Happening?":4, "Misc":5]
    let cat_names1 = ["deals1", "hh1", "rec1", "wh1", "misc1"]
    let selected_cat_names1 = ["dealsf1", "hhf1", "recf1", "whf1", "miscf1"]
    let category_clicked_combinations = [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]
    
    var posts = [[Post]](repeating: [], count: 5)
    var category_id:Int
    var currCategory:String {
        willSet {
            objectWillChange.send()
        }
    }
    let userLongitude = "50.2"
    let userLatitude = "1.0"
    
    init() {
        self.currCategory = "Deals"
        self.category_id = Int(UserDefaults.standard.string(forKey: defaultsKeys.default_category_id)!)!
        self.category_clicked = category_clicked_combinations[category_id - 1]
        self.fetching = false
    }
    
    func setCategory(category: String) {
        self.currCategory = category
        self.category_id = categoriesMap[category]!
        self.category_clicked = category_clicked_combinations[categoriesMap[category]! - 1]
        print(self.currCategory)
    }
    
    func fetchData(latitude: String, longitude: String) {
        self.category_clicked = category_clicked_combinations[Int(UserDefaults.standard.string(forKey: defaultsKeys.default_category_id)!)! - 1]
        self.currCategory = categories[Int(UserDefaults.standard.string(forKey: defaultsKeys.default_category_id)!)! - 1]
        API().getRadius(longitude: longitude, latitude: latitude)
        { (result) in
            switch result
            {
                case .success(let radius):
                    UserDefaults.standard.set(radius.radius, forKey: defaultsKeys.radius)
                    let group = DispatchGroup()
                    for category in self.categories
                    {
                        group.enter()
                        API().getPosts(longitude: longitude, latitude: latitude, category: category)
                        {(result) in
                            switch result
                            {
                                case .success(let posts):
                                    print(posts)
                                    self.posts[self.categoriesMap[category]! - 1] = posts
                                case .failure(let error):
                                    print(error)
                            }
                            group.leave()
                        }
                    }
                    group.notify(queue: .main, execute: {
                        print(self.posts[0])
                        self.fetching = true
                    })
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func refreshCategory(category: String, longitude: String, latitude: String)
    {
        API().getRadius(longitude: longitude, latitude: latitude)
        { (result) in
            switch result
            {
                case .success(let radius):
                    UserDefaults.standard.set(radius.radius, forKey: defaultsKeys.radius)
                    self.fetching = true
                    API().getPosts(longitude: longitude, latitude: latitude, category: category)
                    { (result) in
                        switch result
                        {
                            case .success(let posts):
                                print(posts)
                                self.posts[self.categoriesMap[category]! - 1] = posts
                                self.fetching = true
                            case .failure(let error):
                                print(error)
                        }
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}

