//
//  MaquinasViewController.swift
//  Nospresso
//
//  Created by Ricardo Carra Marsilio on 22/10/20.
//

import UIKit

class MaquinasViewController: UIViewController {
    
    typealias Presenter = MaquinasPresenterType & UICollectionViewDataSource

    @IBOutlet weak var maquinaCollectionView: UICollectionView!
    
    lazy var presenter: Presenter = MaquinasPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        maquinaCollectionView.delegate = self
        maquinaCollectionView.dataSource = self.presenter
        maquinaCollectionView.register(R.nib.maquinaCollectionViewCell)
        presenter.telaCarregou()
    }

}

extension MaquinasViewController: MaquinasViewType {
    
    func recarregarColecao() {
        DispatchQueue.main.async {
            self.maquinaCollectionView.reloadData()
        }
    }
    
}

extension MaquinasViewController: UICollectionViewDelegateFlowLayout {
    
    enum ConstantesDeLayout {
        static let alturaDaCelula = 260
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        <#code#>
//    }
    
}
