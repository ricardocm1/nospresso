//
//  CafeTableViewCell.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 15/10/20.
//

import UIKit

class CafeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cafeImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var intensidadeLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    
    
    func configurar(com cafe: Cafe) {
        cafeImageView.carregarImagem(usando: cafe.imagem)
        nomeLabel.text = cafe.nome
        descricaoLabel.text = cafe.descricao
        precoLabel.text = cafe.precoUnitario.formatoMoeda()
        
        if let intensidade = cafe.intensidade {
            intensidadeLabel.text = String("Intensidade \(intensidade)")
        }
    }
    
}
