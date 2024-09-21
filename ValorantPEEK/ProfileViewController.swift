//
//  ProfileViewController.swift
//  ValorantPEEK
//
//  Created by Atharian Rahmadani on 21/09/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.ValorantPeekPrimaryColor.cgColor
        profileImageView.layer.cornerRadius = 16
        profileImageView.clipsToBounds = true
    }
}
