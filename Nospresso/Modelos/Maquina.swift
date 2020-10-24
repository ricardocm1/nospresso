//
//  Maquina.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 13/10/20.
//

import Foundation

public struct Maquina: Produto, CustomStringConvertible {
    var tipo: TipoProduto { .maquina }
    
    public var description: String { nome }
    
    let id: Int
    let nome: String
    let preco: Double
    let descricao: String
    let imagem: String
}

public typealias ListaDeMaquinas = [Maquina]
