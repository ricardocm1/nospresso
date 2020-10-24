//
//  Cafe.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 13/10/20.
//

import Foundation

public struct Cafe: Produto {
    var preco: Double {
        precoUnitario
    }
    
    var tipo: TipoProduto { .cafe }
    
    let id: Int
    let nome: String
    let descricao: String
    let intensidade: Int?
    let precoUnitario: Double
    let imagem: String
    let medidas: [Medida]
    let origem: String?
    let torrefacao: String?
    let perfilAromatico: String?
    
    var precoSleeve: Double {
        precoUnitario * 10
    }
}

public enum Medida: String, Codable {
    case lungo, espresso, ristretto
}

