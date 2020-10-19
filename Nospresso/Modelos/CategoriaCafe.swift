//
//  Capsula.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 13/10/20.
//

import Foundation

public struct CategoriaCafe: Decodable {
    let categoria: String
    let cafes: [Cafe]
}
