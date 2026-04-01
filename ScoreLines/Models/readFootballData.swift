//
//  readBasketballData.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/12/22.
//

import Foundation

final class readFootballData: ObservableObject  {
    private static var cachedFootballData: NFLResult?

    @Published var footballData = [NFLResult]()
    @Published var dataLoaded = false

    init(){
        loadFootballData()
    }

    func loadFootballData()  {
        if dataLoaded {
            return
        }

        if let cachedFootballData = Self.cachedFootballData {
            self.footballData = [cachedFootballData]
            self.dataLoaded = true
            return
        }

        guard let url = Bundle.main.url(forResource: "footballData", withExtension: "json") else {
            print("Json file not found")
            return
        }

        do{
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(NFLResult.self, from: data)
            Self.cachedFootballData = result
            self.footballData = [result]
            self.dataLoaded = true
            print(self.footballData[0].data[0].homeTeam)
        }
        catch{
            print("Error \(error)")
        }
    }
}
