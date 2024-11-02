//
//  SecondViewController.swift
//  CatGenerator
//
//  Created by Андрей  Насибулин  on 29.10.2024.
//

import UIKit

struct SecondVCInput {
    let imageData: Data
}

class SecondViewController: UIViewController {
    
    private var input: SecondVCInput?
    
    @IBOutlet weak var catImageView: UIImageView!
    func setInput(with input: SecondVCInput) {
        self.input = input
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
