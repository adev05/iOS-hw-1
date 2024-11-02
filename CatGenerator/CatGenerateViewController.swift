//
//  CatGenerateViewController.swift
//  CatGenerator
//
//  Created by Андрей  Насибулин  on 29.10.2024.
//

import UIKit

class CatGenerateViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var catImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapCatGenerateButton(_ sender: Any) {
        downloadCat()
    }
    
    private func downloadCat() {
        guard let url = URL(string: "https://cataas.com/cat") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async{ [weak self] in
                self?.imgData = data
                self?.performSegue(withIdentifier: "showCatImageSegue", sender: self)
            }
            
        }
        
        task.resume()
    }
    
    private var imgData: Data?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "showCatImageSegue" {
            guard let viewController: SecondViewController = segue.destination as? SecondViewController, let imgData = imgData else {
                return
            }
            
            viewController.setInput(with: SecondVCInput(imageData: imgData))
        }
    }
}
