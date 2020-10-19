//
//  Api.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 13/10/20.
//

import Foundation

class Api {
    let urlBase = "http://localhost:3000"
    
    typealias ResultadoSucesso<T: Decodable> = (T) -> Void
    typealias ResultadoFalha = (String) -> Void
    
    func requisitar<T: Decodable>(endpoint: Endpoint, sucesso: @escaping ResultadoSucesso<T>, falha: @escaping ResultadoFalha) {
        let urlCompleta = "\(urlBase)/\(endpoint.url)"
        
        print(urlCompleta)
        
        guard let url = URL(string: urlCompleta) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dados, resposta, erro) in
//            if let dados = dados {
//                print(String(data: dados, encoding: .utf8)!)
//            }
            
            guard erro == nil else {
                // TODO Validar erro
                return
            }
            
            guard let dados = dados else {
                // TODO Validar dados inválidos
                return
            }
            
            let decodificador = JSONDecoder()
            do {
                let dadosConvertidos = try decodificador.decode(T.self, from: dados)
                sucesso(dadosConvertidos)
            } catch {
                print(error)
                // TODO Tratar erro
            }
            
        }.resume()
    }
}
