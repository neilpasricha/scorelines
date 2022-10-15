//
//  readBasketballData.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/12/22.
//
//THIS IS INTENDED TO TEST SPORTS API's

/*KEYS/HOSTS:
 the-odds: https://api.the-odds-api.com
 the-odds: d5719746b0fee2ab8a268ad93e7881fe
 */
import Foundation


class readSportsData: ObservableObject  {
    //@Published var sportsData = [sportsResult]()
    @Published var sport = "upcoming"
    @Published var region = "us"
    @Published var markets = "h2h,spreads"
    @Published var odds_format = "american"
    @Published var date_format = "iso"
    @Published var dataLoaded = false
    var data_loaded = false
    
    init(){
        if(!self.dataLoaded){
            loadSportsData()
        }
        else{
            print("Data already loaded baby")
        }
    }
    
    func loadSportsData(){
        guard let sports_url = URL(string: "https://api.the-odds-api.com/v4/sports?apiKey=d5719746b0fee2ab8a268ad93e7881fe") else{
            return
        }
        
        let sports_task = URLSession.shared.dataTask(with: sports_url){
            data, response, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8){
                print("********************************************SPORTS_URL********************************************")
                print(string)
                print("********************************************END SPORTS_URL********************************************")
            }
        }

        
//        guard let url = URL(string: "https://api.the-odds-api.com/v4/sports/americanfootball_nfl/odds/?regions=us&oddsFormat=american&apiKey=d5719746b0fee2ab8a268ad93e7881fe") else{
//            return
//        }
//
//
//        let task = URLSession.shared.dataTask(with: url){
//            data, response, error in
//
//            if let data = data, let string = String(data: data, encoding: .utf8){
//                print("********************************************SPORTS FUCKING DATA BABY********************************************")
//                print(string)
//                print("********************************************END SPORTS FUCKING DATA BABY********************************************")
//            }
//        }
        
       // task.resume()
        sports_task.resume()
    }
}
//}
