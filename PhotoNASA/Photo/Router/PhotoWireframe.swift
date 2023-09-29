//
//  PhotoWireframe.swift
//  PhotoNASA
//
//  Created by Cristian guillermo Romero garcia on 24/09/23.
//

import Foundation
import UIKit
 
class PhotoWireframe: PhotoWireframeProtocol{
    static func getPhotoModule() -> UIViewController {
        
        //Generate VIPER components
        let photoStoryboard = UIStoryboard(name: "PhotoStoryboard", bundle: .main)
        let view = photoStoryboard.instantiateViewController(withIdentifier: "PhotoVC") as! PhotoViewController
        let presenter = PhotoPresenter()
        let interactor = PhotoInteractor()
        let wireframe = PhotoWireframe()
        
        //Conecting
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        
        return view
    }
    
    
}
