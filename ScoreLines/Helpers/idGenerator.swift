//
//  idGenerator.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/5/22.
//

import SwiftUI
class idGenerator: ObservableObject{
    @Published var feedIDs: [Int] = []
    @State var maxValue: Int = 2147483645
    @State var id: Int = Int.random(in: 1..<2147483645)
    
    /*
    
    //aite this logic looks just fine but im hammered enough to also know one thing
    First of all it's making an ID for someone with a randomly generated ID between
     0-2,147,483,645. If that happens once holy shit. If it happens twice ill delete the app.
     
     */
    func generateID() ->Int{
        return self.id
    }
    func didSet(execute: @escaping (Int) ->Void) -> Binding<Int> {
        return Binding(
            get: {
                return self.id
            },
            set: {
                self.id = $0
                execute($0)
            }
        )
    }
    
    /*
//    func generateID() ->Int{
//        let maxValue = UInt8.max
//
//        self.id =  Int.random(in: 1..<Int(maxValue))
//
//
//
//        if(feedIDs.contains(id)){
//            for i in 0...Int(maxValue) {
//                self.id = Int.random(in: 1..<Int(maxValue))
//                if(feedIDs.contains(self.id)){
//                    continue
//                }
//                else{
//                    return self.id
//                }
//            }
//        }
//
//        return self.id
//
//    }
    */
}

