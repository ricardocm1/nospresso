//
//  String+TextoAtribuido.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 23/10/20.
//

import UIKit

extension String {
    
    @discardableResult
    func estilizadaCom(_ fonte: UIFont, cor: UIColor) -> NSMutableAttributedString {
        let atributos: [NSMutableAttributedString.Key: Any] = [
            .font: fonte,
            .foregroundColor: cor
        ]
        
        return NSMutableAttributedString(string: self, attributes: atributos)
    }
    
}
