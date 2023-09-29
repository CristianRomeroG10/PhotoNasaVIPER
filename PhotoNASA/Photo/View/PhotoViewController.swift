//
//  PhotoViewController.swift
//  PhotoNASA
//
//  Created by Cristian guillermo Romero garcia on 23/09/23.
//

import UIKit

class PhotoViewController: UIViewController, PhotoViewProtocol {
    
    //MARK: VIPER protocol
    var presenter: PhotoPresenterProtocol?
    
    
    //MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var copyrigthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    
    //MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    

    func setUpUI(){
        postImageView.image = UIImage(named: "placeHolderImage")
        loaderView.stopAnimating()
        loaderView.isHidden = true
        titleLabel.text = "..."
        dateLabel.text = "..."
        copyrigthLabel.text = "..."
    }
    
    func animateLoader(isAnimating: Bool){
        DispatchQueue.main.async{
            self.loaderView.isHidden = !isAnimating
            if isAnimating{
                self.loaderView.startAnimating()
            }else{
                self.loaderView.stopAnimating()
            }
        }
    }
    
    func displayPhotoInfo(photoInfo: PhotoInfo){
        DispatchQueue.main.async {
            self.titleLabel.text = photoInfo.title
            self.dateLabel.text = photoInfo.date
            self.postTextView.text = photoInfo.description
            self.copyrigthLabel.text = photoInfo.copyright
        }
        
    }
    func displayImage(image: UIImage){
        DispatchQueue.main.async{
            self.postImageView.image = image
        }
    }

}
