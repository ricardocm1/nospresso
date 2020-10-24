//
//  Favoritos.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 24/10/20.
//

import Foundation

class Favoritos {
    static let instancia = Favoritos()
    let chaveFavoritos = "nospresso-favoritos"
    
    var listaDeProdutos: [Favorito] = []
    let userDefaults = UserDefaults.standard
    
    func alternar(_ produto: Produto) -> Bool {
        let favorito = Favorito(produto: produto)
        
        defer {
            atualizarArmazenamentoLocal()
        }
        
        if let indiceDoProduto = listaDeProdutos.firstIndex(of: favorito) {
            listaDeProdutos.remove(at: indiceDoProduto)
            return false
        }
        
        listaDeProdutos.append(favorito)
        return true
    }
    
    func remover(produto: Produto) {
        let favorito = Favorito(produto: produto)

        if let indiceDoProduto = listaDeProdutos.firstIndex(of: favorito) {
            listaDeProdutos.remove(at: indiceDoProduto)
            atualizarArmazenamentoLocal()
        }
    }
    
    func verificarFavorito(do produto: Produto) -> Bool {
        listaDeProdutos.contains(.init(produto: produto))
    }
    
    init() {
        buscarDoArmazenamentoLocal()
    }
}

private extension Favoritos {

    func atualizarArmazenamentoLocal() {
        guard let dadosCodificados = try? JSONEncoder().encode(listaDeProdutos) else { return }
        
        userDefaults.setValue(dadosCodificados, forKey: chaveFavoritos)
    }
    
    func buscarDoArmazenamentoLocal() {
        guard let dados = userDefaults.data(forKey: chaveFavoritos),
              let favoritosDecodificados = try? JSONDecoder().decode([Favorito].self, from: dados)
        else { return }
        
        listaDeProdutos = favoritosDecodificados
    }
    
}
