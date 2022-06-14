//
//  SettingTabelView.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 2.06.22.
//

//import UIKit
//
//final class SettingTabelView: View {
//        
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.delegate   = self
//        tableView.dataSource = self
//        tableView.backgroundColor = .clear
//        return tableView
//    }()
//    
//    override func setup() {
//        addSubview(tableView)
//        setupSettingTabelView()
//        self.tableView.rowHeight = 60
//    }
//    
//    private func setupSettingTabelView() {
//        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        let constraints = [
//  
//            tableView.topAnchor.constraint(equalTo: self.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
//        ]
//        
//        NSLayoutConstraint.activate(constraints)
//    }
//    
//}
//
//extension SettingTabelView: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 8
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = SettingCell(
//            reuseIdentifier: "cell",
//            icon: ImageView(image: .lock),
//            label: Label(style: .tableSettingLabel, "User agreement")
//         
//        )
//        switch indexPath.row {
//        case 0:
//            cell = SettingCell(
//                reuseIdentifier: "cell",
//                icon: ImageView(image: .lock),
//                label: Label(style: .tableSettingLabel, "FAQ")
//            )
//        case 1:
//            cell = SettingCell(
//                reuseIdentifier: "cell",
//                icon: ImageView(image: .faq),
//                label: Label(style: .tableSettingLabel, "Unlock all features")
//            )
//        case 2:
//            cell = SettingCell(
//                reuseIdentifier: "cell",
//                icon: ImageView(image: .rate),
//                label: Label(style: .tableSettingLabel, "Rate us")
//            )
//        case 3:
//            cell = SettingCell(
//                reuseIdentifier: "cell",
//                icon: ImageView(image: .support),
//                label: Label(style: .tableSettingLabel, "Support")
//            )
//        case 4:
//            cell = SettingCell(
//                reuseIdentifier: "cell",
//                icon: ImageView(image: .privacy),
//                label: Label(style: .tableSettingLabel, "Privacy policy")
//            )
//        case 5:
//            cell = SettingCell(
//                reuseIdentifier: "cell",
//                icon: ImageView(image: .terms),
//                label: Label(style: .tableSettingLabel, "Terms of use")
//            )
//        case 6:
//            cell = SettingCell(
//                reuseIdentifier: "cell",
//                icon: ImageView(image: .share),
//                label: Label(style: .tableSettingLabel, "Share with friends")
//            )
//        case 7:
//            cell = SettingCell(
//                reuseIdentifier: "cell",
//                icon: ImageView(image: .distance),
//                label: Label(style: .tableSettingLabel, "Distance")
//            )
//            
//        default:
//            break
//        }
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0:
//           print("FAQ")
//        case 1:
//            print("Unlock all")
//            
//        case 2:
//            print("Rate as")
//        case 3:
//            let email = "foo@bar.com"
//            if let url = URL(string: "mailto:\(email)") {
//               UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        case 4:
//            if let url = URL(string: "https://www.mindateq.io/privacy-policy") {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        case 5:
//            if let url = URL(string: "https://www.mindateq.io/terms-of-use") {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        case 6:
//            print("shere")
//        case 7:
//            print("distance")
//        default:
//            break
//        }
//        
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//    
//    
//}
//
