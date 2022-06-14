//
//  BluetoothTableViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 1.06.22.
//

import UIKit
import CoreBluetooth

final class BluetoothTableViewController: UIViewController, CBPeripheralDelegate {
    
    // MARK: - BluetoothTableViewController variables
    
    let settingVC = SettingViewController()
    
    var centralManager: CBCentralManager!
    var bluetoothIdentifiers: [UUID] = []
    var bluetoothArray: [CBPeripheral] = []
    var nameArray:[String] = []
    var counter = 0
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 106
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    lazy var myRefresh: UIRefreshControl = {
        let myRefresh = UIRefreshControl()
        myRefresh.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return myRefresh
    }()
    
    // MARK: - BluetoothTableViewController viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        self.view.backgroundColor = R.color.backgroundColorBluetooth()
        configureNavigationSetting()
        setupTabelView()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    // MARK: - BluetoothTableViewController setupView
    private func setupTabelView() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    private func configureNavigationSetting(){
        self.navigationItem.title = "Bluetooth finder"
        self.navigationItem.backButtonTitle = ""
        
        let attributes = [NSAttributedString.Key.foregroundColor: R.color.settingButtonColor(),
                          NSAttributedString.Key.font:UIFont(name: "Verdana", size: 20)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape")?.withTintColor(R.color.settingButtonColor() ?? .darkGray, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(settingTap))
    }
    
    // MARK: - BluetoothTableViewController funcs
    private func scanForDevices() {
        counter = 0
        bluetoothArray = []
        bluetoothIdentifiers = []
        tableView.reloadData()
        centralManager.scanForPeripherals(withServices: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.centralManager.stopScan()
            if self.bluetoothArray.count > 0 {
                self.tableView.reloadData()
            }
            else {
                self.tableView.reloadData()
            }
        }
    }
    
    @objc private func settingTap() {
        navigationController?.pushViewController(settingVC, animated: true)
    }
    @objc private func refresh(sender: UIRefreshControl){
        scanForDevices()
    }
}

// MARK: - BluetoothTableViewController TableViewDelegate and DataSource
extension BluetoothTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 70))
        header.backgroundColor = R.color.backgroundColorBluetooth()
        let label = UILabel(frame: CGRect(x: 14, y: 5, width: header.frame.size.width , height: header.frame.size.height - 10))
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 14, y: 5, width: header.frame.size.width + 275, height: header.frame.size.height - 10))
        header.addSubview(label)
        header.addSubview(indicator)
        indicator.color = R.color.activityIndicatorColor()
        indicator.startAnimating()
        label.text = "Other Devices"
        label.textColor = R.color.settingTextColor()
        label.font = R.font.gilroySemibold(size: 32)
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let device = nameArray[indexPath.row]
        
        var cell = BluetoothTableViewCell(
            reuseIdentifier: "cell",
            icon: ImageView(image: .bluetooth),
            label: Label(style: .tableBluetoothLabel, "\(device)")
        )
        
        if device.contains("Apple Watch") {
            cell = BluetoothTableViewCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .whatch),
                label: Label(style: .tableBluetoothLabel, "\(device)")
            )
        }
        
        if device.contains("MacBook") {
            cell = BluetoothTableViewCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .notebook),
                label: Label(style: .tableBluetoothLabel, "\(device)")
            )
        }
        if device.contains("AirPods") {
            cell = BluetoothTableViewCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .airpods),
                label: Label(style: .tableBluetoothLabel, "\(device)")
            )
        }
        if device.contains("[LG]") {
            cell = BluetoothTableViewCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .tv),
                label: Label(style: .tableBluetoothLabel, "\(device)")
            )
        }
        if device.contains("SRS") {
            cell = BluetoothTableViewCell(
                reuseIdentifier: "cell",
                icon: ImageView(image: .speaker),
                label: Label(style: .tableBluetoothLabel, "\(device)")
            )
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = nameArray[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = DetailsViewController()
        vc.title = name
        navigationController?.pushViewController(vc, animated: true)
        print("tap")
    }
}

// MARK: - BluetoothTableViewController CBCCentralManager
extension BluetoothTableViewController: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central.state is .unknown")
        case .resetting:
            print("central.state is .resetting")
        case .unsupported:
            print("central.state is .unsupported")
        case .unauthorized:
            print("central.state is .unauthorized")
        case .poweredOff:
            print("central.state is .poweredOff")
            print ("open view")
        case .poweredOn:
            print("central.state is .poweredOn")
            centralManager.scanForPeripherals(withServices: nil)
        @unknown default:
            print("central.state is @unknown default")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if !(self.bluetoothArray.contains(peripheral)){
            
            self.bluetoothArray.append(peripheral)
            
            if peripheral.name != nil {
                
                self.nameArray.append(peripheral.name!)
            }
            
            peripheral.delegate = self
        }
        
        tableView.reloadData()
    }
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("we did it! Connected to: \(String(describing: peripheral))")
        
    }
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("failed")
    }
}

