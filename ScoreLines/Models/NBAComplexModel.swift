//
//  NBAComplexModel.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

struct NBAComplexModel: Decodable{
       var team1Name: String
       var team2Name: String
    
       var gameClockMin: Int
       var gameClockSec: Int
       var gameQuarter: Int
    
       var team1W: Int
       var team1L: Int
       var team2W: Int
       var team2L: Int
    
       var team1ML: Int
       var team1Spread: Int
       var team2ML: Int
       var team2Spread: Int
    
       var team1Score: Int
       var team2Score: Int
    
       var total: Double
       var totalScore: Double
       var totalDiff: Double
}
