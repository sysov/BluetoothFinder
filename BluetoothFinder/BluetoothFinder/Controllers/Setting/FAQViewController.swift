//
//  FAQViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 3.06.22.
//

import UIKit

final class FAQViewController: UIViewController {
    
    private let labelFAQ: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FAQCellTableViewCell.self, forCellReuseIdentifier: FAQCellTableViewCell.indetifire)
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(labelFAQ)
        setUpLabel()
        view.addSubview(tableView)
        setUpSettingTabelView()
        tableView.rowHeight = 160
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    private func setUpLabel() {
        labelFAQ.topAnchor.constraint(equalTo: view.topAnchor, constant: 76).isActive = true
        labelFAQ.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        labelFAQ.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        labelFAQ.contentMode = .scaleAspectFit
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineHeightMultiple = 2
        let attributes = [
            NSAttributedString.Key.foregroundColor: R.color.settingTextColor(),
            NSAttributedString.Key.font: R.font.gilroySemibold(size: 32), .paragraphStyle: paragraphStyle
        ]
        labelFAQ.attributedText = NSAttributedString(string: "FAQ", attributes: attributes as [NSAttributedString.Key : Any])
    }
    
    private func setUpSettingTabelView() {
        tableView.topAnchor.constraint(equalTo: labelFAQ.bottomAnchor, constant: 16 ).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension FAQViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FAQCellTableViewCell.indetifire, for: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
}
