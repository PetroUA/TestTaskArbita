//
//  LoadingViewController.swift
//  TestTaskArbita
//
//  Created by Petro on 21.09.2021.
//
import Foundation
import UIKit
import WebKit

class LoadingViewController: UIViewController, WKUIDelegate {
    let key = "666818eb5a3d3e"
    
    var webView: WKWebView!
    let myURL = URL(string:"https://www.apple.com")
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationApi = LocationApi(apiKey: key)
        locationApi.getSources { [weak self] (result) in
            DispatchQueue.main.async {
                print("!!!\(result)")
                guard let response = try? result.get(), response.country.lowercased() != "ru" else {
                    self?.showWebView()
                    let myRequest = URLRequest(url: self!.myURL!)
                    self!.webView.load(myRequest)
                    return
                }
                self?.showGame()
            }
        }
        
    }
    
    func showWebView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    func showGame() {
        let storyboard = UIStoryboard(name: "ChoseLevelStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "choseLevelStoryboard")
        self.present(vc, animated: true)
    }
    
}
