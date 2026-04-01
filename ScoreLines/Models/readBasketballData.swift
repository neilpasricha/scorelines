//
//  readBasketballData.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/12/22.
//

import Foundation

final class readBasketballData: ObservableObject  {
    private static var cachedBasketballData: NBAResult?

    @Published var basketballData = [NBAResult]()
    @Published var dataLoaded = false

    init(){
        loadBasketballData()
    }
    
    func loadBasketballData()  {
        if dataLoaded {
            return
        }

        if let cachedBasketballData = Self.cachedBasketballData {
            self.basketballData = [cachedBasketballData]
            self.dataLoaded = true
            return
        }

        guard let url = Bundle.main.url(forResource: "basketballData", withExtension: "json") else {
            print("Json file not found")
            return
        }

        do{
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(NBAResult.self, from: data)
            Self.cachedBasketballData = result
            self.basketballData = [result]
            self.dataLoaded = true
            print(self.basketballData[0].data[0].homeTeam)
        }
        catch{
            print("Error \(error)")
        }
    }
}
