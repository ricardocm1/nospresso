//
//  DetalheCafeViewController.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 20/10/20.
//

import UIKit

class DetalheCafeViewController: UIViewController {
    
    @IBOutlet weak var cafeImageView: UIImageView!
    @IBOutlet weak var intensidadeStackView: ContadorIntensidadeStackView!
    @IBOutlet weak var medidasStackView: UIStackView!
    @IBOutlet weak var intensidadeLabel: UILabel!
    @IBOutlet weak var precoPorSleeveLabel: UILabel!
    @IBOutlet weak var origemLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var torrefacaoLabel: UILabel!
    
    var presenter: DetalheCafePresenterType?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.telaCarregou()
    }
    
    @objc
    func toqueFavorito() {
        presenter?.apertouFavoritar()
    }

}

extension DetalheCafeViewController: DetalheCafeViewType {
    
    func exibirTitulo(_ titulo: String) {
        title = titulo
    }
    
    func exibirDados(do cafe: Cafe) {
        DispatchQueue.main.async {
            self.cafeImageView.carregarImagem(usando: cafe.imagem)
            
            if let intensidade = cafe.intensidade {
                self.intensidadeStackView.configurar(para: intensidade)
                self.intensidadeLabel.text = "intensidade: \(intensidade)"
            } else {
                self.intensidadeLabel.isHidden = true
            }
            
            self.precoPorSleeveLabel.attributedText = self.construirDescricaoDePreco(cafe.precoSleeve)
            
            self.descricaoLabel.text = cafe.descricao
            self.origemLabel.text = cafe.origem
            self.torrefacaoLabel.text = cafe.torrefacao
//            self.perfilAromaticoLabel.text = cafe.perfilAromatico
            
            for medida in cafe.medidas {
                let view  = MedidaView.doNib()
                view.configurar(com: medida)
                self.medidasStackView.addArrangedSubview(view)
            }
            
            self.medidasStackView.addArrangedSubview(UIView())
        }
    }
    
    func configurarFavoritismo(_ favoritado: Bool) {
        let imagem = favoritado ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        let tintura = favoritado ? UIColor.red : UIColor.black
        
        let botaoDeAcao = UIBarButtonItem.init(image: imagem, style: .plain, target: self, action: #selector(toqueFavorito))
        
        botaoDeAcao.tintColor = tintura
        
        navigationItem.rightBarButtonItem = botaoDeAcao
    }

}

private extension DetalheCafeViewController {
    
    func construirDescricaoDePreco(_ precoSleeve: Double) -> NSMutableAttributedString {
        let primeiraParte = "10 cápsulas, ".estilizadaCom(Fontes.openSansLight(size: 12)!, cor: Paleta.textoDiscreto()!)
        let segundaParte = precoSleeve.formatoMoeda().estilizadaCom(Fontes.openSansLight(size: 24)!, cor: .black)
        
        primeiraParte.append(segundaParte)
        
        return primeiraParte
    }
    
}
