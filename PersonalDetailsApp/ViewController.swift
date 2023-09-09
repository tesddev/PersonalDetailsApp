//
//  ViewController.swift
//  PersonalDetailsApp
//
//  Created by Tes on 09/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "HNG Task 1"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    var slackNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Slack name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    var trackLabel: UILabel = {
        let label = UILabel()
        label.text = "Track"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let detailsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 3
        return view
    }()
    
    lazy var goToGithubButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open GitHub", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.addTarget(self, action: #selector(didTapGithubButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        activateConstraint()
    }
    
    private func activateConstraint() {
        view.addSubview(headerLabel)
        view.addSubview(goToGithubButton)
        view.addSubview(detailsView)
//        detailsView.addSubview(UIView)
//        detailsView.addSubview(UIView)
//        detailsView.addSubview(UIView)
//        detailsView.addSubview(UIView)
//        detailsView.addSubview(UIView)

        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            detailsView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            detailsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsView.widthAnchor.constraint(equalTo: goToGithubButton.widthAnchor),
            detailsView.heightAnchor.constraint(equalToConstant: 48),
            
            goToGithubButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            goToGithubButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToGithubButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            goToGithubButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func throwAlertWith(message: String){
        let alertView = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "OK", style: .default, handler:nil)
         alertView.addAction(okAction)
         self.present(alertView, animated: true, completion: nil)
    }
    
    @objc func didTapGithubButton(){
        let vc = GithubProfileViewController(link: "https://github.com/tesddev", isLinkTextfieldHidden: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

