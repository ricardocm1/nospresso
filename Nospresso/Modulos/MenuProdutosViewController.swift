//
//  MenuProdutosViewController.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 17/10/20.
//

import UIKit

class MenuProdutosViewController: UIViewController {
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//
//        navigationController?.setNavigationBarHidden(false, animated: true)
//
//    }
    
    @IBOutlet private weak var maquinaView: UIView!
    
    @objc
    private func tocouEmMaquinas(_ remetente: Any) {
        let vc = MaquinasViewController(nib: R.nib.maquinasViewController)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removerTextoDoBotaoVoltar()
        
        let reconhecedor = UITapGestureRecognizer(target: self, action: #selector(self.tocouEmMaquinas))
        maquinaView.addGestureRecognizer(reconhecedor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
