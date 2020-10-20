//
//  Double+FormatoMoeda.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 19/10/20.
//

import Foundation

extension Double {
    
    func formatoMoeda(comPrefixo: Bool = true) -> String {
        let prefixo = "R$ "
        let valor = NSNumber(value: self)
        
        let formato = NumberFormatter()
        formato.numberStyle = .currency
        
        formato.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
        
        let replacer = comPrefixo ? "\(prefixo)" : ""
        
        return formato.string(from: valor)?.replacingOccurrences(of: "\(prefixo)", with: replacer) ?? ""
    }
    
}
