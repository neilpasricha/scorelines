//
//  NBAComplexModel.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//
import Foundation

struct Result: Codable{
    let data: [NBAComplexModel]
}

struct NBAComplexModel: Codable, Identifiable{
    enum CodingKeys: CodingKey {
        case type
        case team1Name
        case team2name
        case current_possession
        case gameClockMin
        case gameClockSec
        case gameQuarter
        case team1W
        case team1L
        case team2W
        case team2L
        case team1ML
        case team1Spread
        case team2ML
        case team2Spread
        case team1Score
        case team2Score
        case team1Q1
        case team1Q2
        case team1Q3
        case team1Q4
        case team2Q1
        case team2Q2
        case team2Q3
        case team2Q4
        case total
        case totalScore
        case totalDiff
    }
       
        var id = UUID()
        var type: String
        var team1Name: String
        var team2name: String
        var current_possession: String
    
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
        var team1Q1: Int
        var team1Q2: Int
        var team1Q3: Int
        var team1Q4: Int
            
        var team2Q1: Int
        var team2Q2: Int
        var team2Q3: Int
        var team2Q4: Int
    
        var total: Double
        var totalScore: Double
        var totalDiff: Double
}
