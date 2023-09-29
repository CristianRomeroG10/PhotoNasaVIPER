//
//  PhotoPresenter.swift
//  PhotoNASA
//
//  Created by Cristian guillermo Romero garcia on 24/09/23.
//

import Foundation
import UIKit

class PhotoPresenter: PhotoPresenterProtocol, PhotoInteractorOutputProtocol {
    
    
    //MARK: VIPER PROPERTIES
    var view: PhotoViewProtocol?
    var interactor: PhotoInteractorInputProtocol?
    var wireframe: PhotoWireframeProtocol?
    
    func viewDidLoad() {
        view?.setUpUI()
        view?.animateLoader(isAnimating: true)
        interactor?.fetchPhotoInfo()
    }
    
    func didGetPhotoInfo(photoInfo: PhotoInfo) {
        view?.displayPhotoInfo(photoInfo: photoInfo)
    }
    func didGetImage(image: UIImage) {
        view?.displayImage(image: image)
        view?.animateLoader(isAnimating: false)
    }
    
}
