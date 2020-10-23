//
//  MedidaView.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 22/10/20.
//

import UIKit

class MedidaView: UIView {
    @IBOutlet weak var canequinhaImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!

    class func doNib() -> MedidaView {
        R.nib.medidaView.firstView(owner: nil)!
    }
    
    func configurar(com medida: Medida) {
        canequinhaImageView.image = medida.imagem
        nomeLabel.text = medida.rawValue
    }

}

extension Medida {
    var imagem: UIImage? {
        switch self {
        case .espresso:
            return Imagens.ic_espresso()
        case .lungo:
            return Imagens.ic_lungo()
        case .ristretto:
            return Imagens.ic_ristretto()
        }
    }
}
