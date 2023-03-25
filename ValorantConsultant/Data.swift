//
//  Data.swift
//  ValoranConsultant
//
//  Created by Miguel Correa Avila on 14/3/23.
//
import SwiftUI

 // Data Models to store requested information.
 struct Object: Codable, Hashable{
     let uuid:String
     let displayName:String
     let description:String
     let developerName: String
     let killfeedPortrait: String
    
     
     
     
 }
 struct Agent: Codable, Hashable{
     let status: Int
     let data:[Object]
 }
