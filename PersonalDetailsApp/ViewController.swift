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
        label.text = "Name:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    var slackNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Slack name:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    var trackLabel: UILabel = {
        let label = UILabel()
        label.text = "Track:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    var theNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tesleem Amuda"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    var theSlackNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tes"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    var theTrackLabel: UILabel = {
        let label = UILabel()
        label.text = "Mobile"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let detailsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect())
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var goToGithubButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open GitHub", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.addTarget(self, action: #selector(didTapGithubButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
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
        detailsView.addSubview(nameLabel)
        detailsView.addSubview(trackLabel)
        detailsView.addSubview(slackNameLabel)
        detailsView.addSubview(theNameLabel)
        detailsView.addSubview(theSlackNameLabel)
        detailsView.addSubview(theTrackLabel)
        view.addSubview(profileImageView)

        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            detailsView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            detailsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsView.widthAnchor.constraint(equalTo: goToGithubButton.widthAnchor),
            detailsView.heightAnchor.constraint(equalToConstant: 160),
            
            nameLabel.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 20),
            
            slackNameLabel.centerYAnchor.constraint(equalTo: detailsView.centerYAnchor),
            slackNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            trackLabel.bottomAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: -20),
            trackLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            theNameLabel.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: 20),
            theNameLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -20),
            
            theSlackNameLabel.centerYAnchor.constraint(equalTo: detailsView.centerYAnchor),
            theSlackNameLabel.trailingAnchor.constraint(equalTo: theNameLabel.trailingAnchor),
            
            theTrackLabel.bottomAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: -20),
            theTrackLabel.trailingAnchor.constraint(equalTo: theNameLabel.trailingAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: 30),
            profileImageView.widthAnchor.constraint(equalTo: goToGithubButton.widthAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: goToGithubButton.topAnchor, constant: -30),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
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

