//
//  DetailViewController.swift
//  ValorantPEEK
//
//  Created by Atharian Rahmadani on 21/09/24.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var valorantAgentImageView: UIImageView!
    
    @IBOutlet weak var valorantAgentNameLabel: UILabel!
    
    @IBOutlet weak var valorantAgentDescriptionLabel: UILabel!
    
    @IBOutlet weak var valorantAgent1stSkillImageView: UIImageView!
    
    @IBOutlet weak var valorantAgent2ndSkillImageView: UIImageView!
    
    @IBOutlet weak var valorantAgent3rdSkillImageView: UIImageView!
    
    @IBOutlet weak var valorantAgent4thSkillImageView: UIImageView!
    
    @IBOutlet weak var valorantAgent1stSkillLoading: UIActivityIndicatorView!
    
    @IBOutlet weak var valorantAgent2ndSkillLoading: UIActivityIndicatorView!
    
    @IBOutlet weak var valorantAgent3rdSkillLoading: UIActivityIndicatorView!
    
    @IBOutlet weak var valorantAgent4thSkillLoading: UIActivityIndicatorView!
    
    @IBOutlet weak var valorantAgent1stSkillLabel: UILabel!
    
    @IBOutlet weak var valorantAgent2ndSkillLabel: UILabel!
    
    @IBOutlet weak var valorantAgent3rdSkillLabel: UILabel!
    
    @IBOutlet weak var valorantAgent4thSkillLabel: UILabel!
    
    var valorantAgent: ValorantAgent? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        if let result = valorantAgent {
            valorantAgentImageView.kf.setImage(with: URL(string: result.image))
            
            valorantAgentNameLabel.text = result.name
            
            valorantAgentDescriptionLabel.text = result.description
            
            valorantAgent1stSkillLoading.isHidden = false
            valorantAgent2ndSkillLoading.isHidden = false
            valorantAgent3rdSkillLoading.isHidden = false
            valorantAgent4thSkillLoading.isHidden = false
            
            valorantAgent1stSkillLoading.startAnimating()
            valorantAgent2ndSkillLoading.startAnimating()
            valorantAgent3rdSkillLoading.startAnimating()
            valorantAgent4thSkillLoading.startAnimating()
            
            valorantAgent1stSkillImageView.kf.setImage(
                with: URL(string: result.skills[0].skillImage),
                completionHandler: { result in
                    self.valorantAgent1stSkillLoading.isHidden = true
                    self.valorantAgent1stSkillLoading.stopAnimating()
                }
            )
            
            valorantAgent2ndSkillImageView.kf.setImage(
                with: URL(string: result.skills[1].skillImage),
                completionHandler: { result in
                    self.valorantAgent2ndSkillLoading.isHidden = true
                    self.valorantAgent2ndSkillLoading.stopAnimating()
                }
            )
            
            valorantAgent3rdSkillImageView.kf.setImage(
                with: URL(string: result.skills[2].skillImage),
                completionHandler: { result in
                    self.valorantAgent3rdSkillLoading.isHidden = true
                    self.valorantAgent3rdSkillLoading.stopAnimating()
                }
            )
            
            valorantAgent4thSkillImageView.kf.setImage(
                with: URL(string: result.skills[3].skillImage),
                completionHandler: { result in
                    self.valorantAgent4thSkillLoading.isHidden = true
                    self.valorantAgent4thSkillLoading.stopAnimating()
                }
            )
            
            valorantAgent1stSkillLabel.text = result.skills[0].skillName
            valorantAgent2ndSkillLabel.text = result.skills[1].skillName
            valorantAgent3rdSkillLabel.text = result.skills[2].skillName
            valorantAgent4thSkillLabel.text = result.skills[3].skillName
        }
    }
}
