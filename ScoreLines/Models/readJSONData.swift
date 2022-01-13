//
//  readJSONData.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/12/22.
//

import Foundation

class readJSONData: ObservableObject  {
    @Published var nbaComplexModel = [Result]()
    @Published var dataLoaded = false
    var data_loaded = false
        
    init(){
        if(!self.dataLoaded){
            loadData()
        }
        else{
            print("Data already loaded baby")
        }
    }
    
    func loadData()  {
        guard let path = Bundle.main.path(forResource: "NBAComplex", ofType: "json")
            else {
                print("Json file not found")
                return
            }
        let url = URL(fileURLWithPath: path)
        print(url)
        var result: Result?
        
        do{
            let data = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: data)
            if let result = result{
                //print(result)
                self.nbaComplexModel.append(result)
                print(self.nbaComplexModel[0].data[0].homeTeam)
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
