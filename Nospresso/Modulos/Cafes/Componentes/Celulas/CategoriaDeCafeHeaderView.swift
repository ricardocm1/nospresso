//
//  CategoriaDeCafeHeaderView.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 18/10/20.
//

import UIKit

class CategoriaDeCafeHeaderView: UIView {

    @IBOutlet weak var tituloLabel: UILabel!
    
    func configurar(para categoria: CategoriaCafe) {
        tituloLabel.text = categoria.categoria
    }
    
}
