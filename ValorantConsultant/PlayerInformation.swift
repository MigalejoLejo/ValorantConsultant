//
//  Data.swift
//  ValoranConsultant
//
//  Created by Miguel Correa Avila on 14/3/23.
//
import SwiftUI

 // Data Models to store requested information.
 struct Player: Codable, Hashable{
     let uuid:String
     let displayName:String
     let description:String
     let developerName: String
     let killfeedPortrait: String
     
     init(){
         uuid = ""
         displayName = ""
         description = ""
         developerName = ""
         killfeedPortrait = ""
     }
 }

 struct AllPlayersModel: Codable, Hashable{
     let status: Int
     let data:[Player]
     
     init() {
         self.status = 0
         self.data = [Player()]
     }
 }

struct SinglePlayerModel: Codable, Hashable{
    let status: Int
    let data:Player
    
    init() {
        self.status = 0
        self.data = Player()
    }
}
