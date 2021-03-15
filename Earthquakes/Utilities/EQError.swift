//
//  EQError.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/13/21.
//

import Foundation

enum EQError : String, Error {
    case invalidURL       = "URL msut be a valid"
    case unableToComplete = "Unable to complete please check your internet connection."
    case invalidResponse  = "Invalid response from the server. Please try again."
    case invalidData      = "The data received fromt the server was invalid. Please try again."
    
    var localizedDescription : String {return self.rawValue}
}
