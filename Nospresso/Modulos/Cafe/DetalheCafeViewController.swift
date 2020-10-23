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
    
    var presenter: DetalheCafePresenterType?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.telaCarregou()
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
            
            for medida in cafe.medidas {
                let view  = MedidaView.doNib()
                view.configurar(com: medida)
                self.medidasStackView.addArrangedSubview(view)
            }
            
            self.medidasStackView.addArrangedSubview(UIView())
        }
    }
    
}
