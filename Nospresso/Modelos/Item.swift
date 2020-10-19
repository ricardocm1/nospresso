//
//  Item.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 13/10/20.
//

import Foundation

public struct Item: Decodable {
    let id: Int
    let nome: String
    let preco: Double
    let imagem: String
    let descricao: String
}
