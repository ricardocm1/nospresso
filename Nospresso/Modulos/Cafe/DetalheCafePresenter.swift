//
//  DetalheCafePresenter.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 20/10/20.
//

import UIKit

class DetalheCafePresenter {
    var view: DetalheCafeViewType?
    var cafe: Cafe?
    let api = Api()
}

extension DetalheCafePresenter: DetalheCafePresenterType {
    
    func telaCarregou() {
        guard let cafe = cafe else { return }
        
        view?.exibirTitulo(cafe.nome)
        view?.configurarFavoritismo(Favoritos.instancia.verificarFavorito(do: cafe))
        api.requisitar(endpoint: .cafe(id: cafe.id), sucesso: { (cafe: Cafe) in
            self.view?.exibirDados(do: cafe)
        },
        falha: { _ in
            
        })
    }
    
    func apertouFavoritar() {
        guard let cafe = cafe else { return }
        
        let estaFavoritado = Favoritos.instancia.alternar(cafe)
        view?.configurarFavoritismo(estaFavoritado)
    }
    
}

extension DetalheCafePresenter {
    
    class func criarModulo(passando cafe: Cafe) -> DetalheCafeViewController {
//        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "DetalheCafeViewController") as? DetalheCafeViewController
        
        let vc = R.storyboard.main.detalheCafeViewController()!
        let presenter = DetalheCafePresenter()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.cafe = cafe
        
        return vc
    }
    
}
