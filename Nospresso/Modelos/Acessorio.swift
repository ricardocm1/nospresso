//
//  Acessorio.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 13/10/20.
//

import Foundation

public struct Acessorio: Decodable {
    let categoria: String
    let itens: [Item]
}
