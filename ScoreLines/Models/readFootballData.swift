//
//  readBasketballData.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/12/22.
//

import Foundation

class readFootballData: ObservableObject  {
    @Published var footballData = [NFLResult]()
    
    @Published var dataLoaded = false
    var data_loaded = false
        
    init(){
        if(!self.dataLoaded){
            loadFootballData()
        }
        else{
            print("Data already loaded baby")
        }
    }
    func loadFootballData()  {
        guard let path = Bundle.main.path(forResource: "footballData", ofType: "json")
            else {
                print("Json file not found")
                return
            }
        let url = URL(fileURLWithPath: path)
        print(url)
        var result: NFLResult?
        
        do{
            let data = try Data(contentsOf: url)
            result = try JSONDecoder().decode(NFLResult.self, from: data)
            if let result = result{
                //print(result)
                self.footballData.append(result)
                print(self.footballData[0].data[0].homeTeam)
                self.dataLoaded = true
            }
            else{
                print("Failed to parse")
            }
            return
            
        }
        catch{
            print("Error \(error)")
        }

    }
}
