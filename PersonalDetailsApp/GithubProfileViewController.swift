//
//  GithubProfileViewController.swift
//  PersonalDetailsApp
//
//  Created by Tes on 09/09/2023.
//

import UIKit
import WebKit

class GithubProfileViewController: UIViewController, WKNavigationDelegate {
    var link: String
    private var activityIndicator: UIActivityIndicatorView!
    
    var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Tes' Github Profile"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let webView: WKWebView = {
        let view = WKWebView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        setActivityIndicator()
        view.backgroundColor = .white
        activateConstraint()
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        view.isUserInteractionEnabled = true
        if let url = NSURL(string: link) {
            let canOpen = UIApplication.shared.canOpenURL(url as URL)
            if canOpen {
                webView.load(NSURLRequest(url: url as URL) as URLRequest)
                print("can open = \(canOpen)")
            } else {
                throwAlertWith(message: "Invalid url, please revalidate the url and try again.")
            }
        } else {
            throwAlertWith(message: "Pasted link contains space and other characters not in a valid link, please revalidate the url and try again.")
            return
        }
    }
    
    func setActivityIndicator(){
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = self.view.center
        activityIndicator.style = UIActivityIndicatorView.Style.large
    }
    
    init(link: String, isLinkTextfieldHidden: Bool = false) {
        self.link = link
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        fatalError("error in loading view")
    }
    
    private func activateConstraint() {
        view.addSubview(headerLabel)
        view.addSubview(webView)
        view.addSubview(backButton)
        view.addSubview(activityIndicator)
        
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            headerLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            webView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.widthAnchor.constraint(equalTo: view.widthAnchor),
            webView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
        ])
    }
    
    @objc func didTapBackButton() {
//        self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func throwAlertWith(message: String){
        let alertView = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "OK", style: .default, handler:nil)
         alertView.addAction(okAction)
         self.present(alertView, animated: true, completion: nil)
    }
}
