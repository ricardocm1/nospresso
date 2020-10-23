//
//  Cafe.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 13/10/20.
//

import Foundation

public struct Cafe: Decodable {
    let id: Int
    let nome: String
    let descricao: String
    let intensidade: Int?
    let precoUnitario: Double
    let imagem: String
    let medidas: [Medida]
}

public enum Medida: String, Decodable {
    case lungo, espresso, ristretto
}

