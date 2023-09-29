//
//  PhotoProtocols.swift
//  PhotoNASA
//
//  Created by Cristian guillermo Romero garcia on 24/09/23.
//

import Foundation
import UIKit

protocol PhotoViewProtocol: AnyObject{
    //MARK: VIPER properties
    var presenter: PhotoPresenterProtocol? { get set }
    
    //MARK: Presenter -> View
    func setUpUI()
    func animateLoader(isAnimating: Bool)
    func displayPhotoInfo(photoInfo: PhotoInfo)
    func displayImage(image: UIImage)
}

protocol PhotoPresenterProtocol: AnyObject{
    //MARK: VIPER properties
    var view: PhotoViewProtocol? {get set}
    var interactor: PhotoInteractorInputProtocol? {get set}
    var wireframe: PhotoWireframeProtocol? {get set}
    
    //MARK: View -> Presenter
    func viewDidLoad()
}

protocol PhotoInteractorInputProtocol: AnyObject{
    //MARK: VIPER properties
    var presenter: PhotoInteractorOutputProtocol? {get set}
    
    //MARK: Presenter -> interactor
    func fetchPhotoInfo()
    
}

protocol PhotoWireframeProtocol: AnyObject{
    //MARK: Static Methods
    static func getPhotoModule() -> UIViewController
    
    //MARK: Presenter -> WireFrame
}
 
protocol PhotoInteractorOutputProtocol: AnyObject{
    //MARK: Interacto -> Presenter
    func didGetPhotoInfo(photoInfo: PhotoInfo)
    func didGetImage(image: UIImage)
}
