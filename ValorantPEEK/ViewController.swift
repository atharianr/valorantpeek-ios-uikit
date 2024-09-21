//
//  ViewController.swift
//  ValorantPEEK
//
//  Created by Atharian Rahmadani on 20/09/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var valorantAgentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valorantAgentTableView.dataSource = self
        valorantAgentTableView.delegate = self
        valorantAgentTableView.register(
            UINib(nibName: "ValorantAgentTableViewCell", bundle: nil),
            forCellReuseIdentifier: "ValorantAgentCell"
        )
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valorantAgents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "ValorantAgentCell",
            for: indexPath
        ) as? ValorantAgentTableViewCell {
            let agent = valorantAgents[indexPath.row]
            return setupCell(cell: cell, agent: agent)
        } else {
            return UITableViewCell()
        }
    }
    
    private func setupCell(cell: ValorantAgentTableViewCell, agent: ValorantAgent) -> ValorantAgentTableViewCell {
        cell.valorantAgentLoadingIndicator.isHidden = false
        cell.valorantAgentLoadingIndicator.startAnimating()
        cell.valorantAgentImageView.layer.borderWidth = 1
        cell.valorantAgentImageView.layer.masksToBounds = false
        cell.valorantAgentImageView.layer.borderColor = UIColor.ValorantPeekPrimaryColor.cgColor
        cell.valorantAgentImageView.layer.cornerRadius = 16
        cell.valorantAgentImageView.clipsToBounds = true
        cell.valorantAgentImageView.kf.setImage(with: URL(string: agent.image))
        cell.valorantAgentImageView.kf.setImage(
            with: URL(string: agent.image),
            completionHandler: { result in
                cell.valorantAgentLoadingIndicator.isHidden = true
                cell.valorantAgentLoadingIndicator.stopAnimating()
            }
        )
        cell.valorantAgentNameLabel.text = agent.name
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: valorantAgents[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
            if let detaiViewController = segue.destination as? DetailViewController {
                detaiViewController.valorantAgent = sender as? ValorantAgent
            }
        }
    }
}

extension UIColor {
    class var ValorantPeekPrimaryColor: UIColor {
        if let color = UIColor(named: "ValorantPeekPrimaryColor") {
            return color
        }
        fatalError("Could not find appBG color")
    }
}
