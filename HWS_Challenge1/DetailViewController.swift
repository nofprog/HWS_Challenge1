//
//  DetailViewController.swift
//  HWS_Challenge1
//
//  Created by J on 2021/03/02.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage?.uppercased()
        
        if let imageToLoad = selectedImage {
            image.image = UIImage(named: imageToLoad)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(TappedShareButton))

    }
    
    @objc func TappedShareButton(){
        
        guard let image = image.image?.jpegData(compressionQuality: 0.8) else {
            print("No image")
            return
        }
        
        //UIActivityViewControllerを生成
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
                
        //UIActivityViewControllerをどこに固定するか、どこから表示するか
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
