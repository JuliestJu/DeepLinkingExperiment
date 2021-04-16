//
//  ViewController.swift
//  DeepLink
//
//  Created by Юлия Воротченко on 16.04.2021.
//

import UIKit
import StoreKit

class ViewController: UIViewController, UITableViewDataSource
{
   

    private let tableView = UITableView()
    let data  = ["Terms", "Privacy", "Contact"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.tableFooterView = self.createFooter()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.frame = view.bounds
    }
    
    private func createFooter() -> UIView {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        footer.backgroundColor = .secondarySystemBackground
        
        let size = (self.view.frame.size.width - 40)/3
        for b in 0..<3 {
            let button = UIButton(frame: CGRect(x: CGFloat(b) * size + CGFloat(b) + 1, y: 0, width: size, height: size))
            footer.addSubview(button)
            button.tag = b + 1
            button.setBackgroundImage(UIImage(named: "App\(b + 1)"), for: .normal)
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        }
        return footer
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        let tag = sender.tag
        switch tag {
        case 1: do {
            guard let url = URL(string: "ms-word://") else {
                return
            }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                let vc = SKStoreProductViewController()
                vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 586447913)], completionBlock: nil)
                self.present(vc, animated: true)
            }
            
        }
        case 2: do {
            guard let url = URL(string: "ms-powerpoint://") else {
                return
            }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                let vc = SKStoreProductViewController()
                vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 586449534)], completionBlock: nil)
                self.present(vc, animated: true)
            }
            
        }
        case 3: do {
            guard let url = URL(string: "ms-excell://") else {
                return
            }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                let vc = SKStoreProductViewController()
                vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 586683407)], completionBlock: nil)
                self.present(vc, animated: true)
            }
            
        }
            
        default:
            return
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
}

