//
//  DetalheCafe+Protocolos.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 20/10/20.
//

import Foundation

protocol DetalheCafeViewType {
    func exibirTitulo(_ titulo: String)
    func exibirDados(do cafe: Cafe)
    func configurarFavoritismo(_: Bool)
}

protocol DetalheCafePresenterType {
    func telaCarregou()
    func apertouFavoritar()
}
