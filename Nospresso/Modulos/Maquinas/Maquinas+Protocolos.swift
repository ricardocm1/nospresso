//
//  Maquinas+Protocolos.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 22/10/20.
//

import Foundation

protocol MaquinasViewType: CarregamentoViewType {
    func recarregarColecao()
}

protocol MaquinasPresenterType {
    func telaCarregou()
    var maquinas: [Maquina] { get }
}
