//
//  UIImageView+CarregarImagem.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 18/10/20.
//

import UIKit
import Nuke

extension UIImageView {
    
    func carregarImage(usando url: String) {
        guard let url = URL(string: url) else { return }
        
        Nuke.loadImage(with: url, into: self)
    }
    
}
