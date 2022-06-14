//
//  SettingViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 1.06.22.
//

import UIKit
import MessageUI

final class SettingViewController: UIViewController {
    
    // MARK: - Setting ViewController variables
    let distanceVC = DisatanceViewController()
    let faqVC = FAQViewController()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    let headerSettingView = HeaderSettingView()
    
    // MARK: - Setting ViewController viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.rowHeight = 60
        self.view.backgroundColor = R.color.backgroundColorBluetooth()
        view.addSubview(headerSettingView)
        setUpHeaderSettingView()
        setUpSettingTabelView()
    }
    
    // MARK: - Setting ViewController func
    private func senMesseg() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["support@mindateq.io"])
            mail.setSubject("Help")
            mail.setMessageBody("<b>Blabla Helps cdscsd </b>", isHTML: true)
            present(mail, animated: true, completion: nil)
        } else {
            print("Cannot send mail")
        }
    }
    private func shereAs() {
        let textToShare = "BluetoothFinder is awesome!  Check out this app about it!"
        
        if let myWebsite = NSURL(string: "http://www.codingexplorer.com/") {
            let objectsToShare: [Any] = [textToShare, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    // MARK: - Setting ViewController setup Views
    private func setUpHeaderSettingView() {
        headerSettingView.translatesAutoresizingMaskIntoConstraints = false
        headerSettingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        headerSettingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        headerSettingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16).isActive = true
    }
    
    private func setUpSettingTabelView() {
        tableView.topAnchor.constraint(equalTo: headerSettingView.bottomAnchor, constant: 30 ).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

// MARK: - Setting ViewController extansion table view
extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = SettingCell(
            reuseIdentifier: "cell",
            icon: ImageView(image: .lock),
            label: Label(style: .tableSettingLabel, "User agreement")
            
        )
        switch indexPath.row {
        case 0:
            cell = SettingCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .lock),
                label: Label(style: .tableSettingLabel, "FAQ")
            )
        case 1:
            cell = SettingCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .faq),
                label: Label(style: .tableSettingLabel, "Unlock all features")
            )
        case 2:
            cell = SettingCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .rate),
                label: Label(style: .tableSettingLabel, "Rate us")
            )
        case 3:
            cell = SettingCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .support),
                label: Label(style: .tableSettingLabel, "Support")
            )
        case 4:
            cell = SettingCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .privacy),
                label: Label(style: .tableSettingLabel, "Privacy policy")
            )
        case 5:
            cell = SettingCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .terms),
                label: Label(style: .tableSettingLabel, "Terms of use")
            )
        case 6:
            cell = SettingCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .share),
                label: Label(style: .tableSettingLabel, "Share with friends")
            )
        case 7:
            cell = SettingCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .distance),
                label: Label(style: .tableSettingLabel, "Distance")
            )
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(faqVC, animated: true)
            print("FAQ")
            
        case 1:
            print("Unlock all")
            
        case 2:
            print("Rate as")
            
            guard let url = URL(string: "itms-apps://itunes.apple.com/app/" + "appId") else {
                return
            }
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                
            } else {
                UIApplication.shared.openURL(url)
            }
        case 3:
            senMesseg()
            
        case 4:
            if let url = URL(string: "https://www.mindateq.io/privacy-policy") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        case 5:
            if let url = URL(string: "https://www.mindateq.io/terms-of-use") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        case 6:
            shereAs()
            print("shere")
        case 7:
            print("distance")
            navigationController?.pushViewController(distanceVC, animated: true)
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SettingViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }
        switch result {
        case .cancelled:
            print("Cancelled")
        case .saved:
            print("Saved")
        case .sent:
            print("Sent")
        case .failed:
            print("Failed to send")
        @unknown default:
            print("Fatal error")
        }
        controller.dismiss(animated: true)
    }
}



