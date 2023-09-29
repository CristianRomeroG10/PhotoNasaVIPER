//
//  PhotoInteractor.swift
//  PhotoNASA
//
//  Created by Cristian guillermo Romero garcia on 24/09/23.
//

import Foundation
import UIKit

class PhotoInteractor: PhotoInteractorInputProtocol{
    var presenter: PhotoInteractorOutputProtocol?
    
    func fetchPhotoInfo() {
        //MARK: VIPER protocol
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                let jsonDecoder = JSONDecoder()
                guard let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) else { return }
                self.presenter?.didGetPhotoInfo(photoInfo: photoInfo)
                self.fetchImage(url: photoInfo.imageURL)
            }
            
        }
        task.resume()
    }
    
    
    private func  fetchImage(url: String){
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                guard let image = UIImage(data: data) else { return }
                self.presenter?.didGetImage(image: image)
                
            }
        }
        task.resume()
    }
}
