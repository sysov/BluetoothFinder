//
//  DeviceScannerViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 13.07.22.
//

import UIKit

class DeviceScannerViewController: UIViewController {
    
    let settingVC = SettingViewController()
    let bleOff = BluetoothOff()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(DeviceScannerCellView.self, forCellReuseIdentifier: DeviceScannerCellView.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 96
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
  
  var deviceScannerViewModel = DeviceScannerViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
      self.view.backgroundColor = R.color.backgroundColorBluetooth()
      configureNavigationSetting()
      registerModelObservers()
      view.addSubview(tableView)
      setupTabelView()
      tableView.dataSource = self
      tableView.delegate = self
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    deviceScannerViewModel.startScan()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    deviceScannerViewModel.stopScan()
  }
  
  private func registerModelObservers() {
  self.deviceScannerViewModel.deviceScannerCellViewModels.addObserver(self) { listViewModels, change in
      
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
      
    }
    
    AlertManager.alertQueue.addObserver(self, options: [.new]) { alerts, change in
      
      guard alerts.count > 0 else { return }
      self.displayAlert(title: alerts[0].title, message: alerts[0].message)
    }
  }
  func displayAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
          switch action.style{
          case .default:
                print("default")

          case .cancel:
                print("cancel")

          case .destructive:
                print("destructive")


          @unknown default:
              print("FATAL ERROR")
          }}))
    self.present(alert, animated: true, completion: nil)
  }
    
    private func setupTabelView() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    private func configureNavigationSetting(){
        self.navigationItem.title = "Find Device"
        self.navigationItem.backButtonTitle = ""
        
        let attributes = [NSAttributedString.Key.foregroundColor: R.color.settingButtonColor(),
                          NSAttributedString.Key.font:UIFont(name: "Verdana", size: 20)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape")?.withTintColor(R.color.settingButtonColor() ?? .darkGray, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(settingTap))
    }
    
    @objc private func settingTap() {
        navigationController?.pushViewController(settingVC, animated: true)
    }
  
}

extension DeviceScannerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 70))
        header.backgroundColor = R.color.backgroundColorBluetooth()
        let label = UILabel(frame: CGRect(x: 14, y: 5, width: header.frame.size.width , height: header.frame.size.height - 10))
        header.addSubview(label)
        label.text = "Other Devices"
        label.textColor = R.color.settingTextColor()
        label.font = R.font.gilroySemibold(size: 32)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      70
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.deviceScannerViewModel.deviceScannerCellViewModels.value.count
  }
    
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: DeviceScannerCellView.identifier, for: indexPath) as! DeviceScannerCellView
      let dv = self.deviceScannerViewModel.deviceScannerCellViewModels.value[indexPath.row]
      cell.deviceViewModel = dv
      cell.iconDevice.image = R.image.bluetooth()
      
      if dv.name.contains("Apple Watch"){
          cell.iconDevice.image = R.image.watch()
      }
      if dv.name.contains("MacBook") {
          cell.iconDevice.image = R.image.notebook()
      }
      if dv.name.contains("AirPods") {
          cell.iconDevice.image = R.image.airpods()
      }
      if dv.name.contains("[LG]") {
          cell.iconDevice.image = R.image.tv()
      }
      if dv.name.contains("SRS") {
          cell.iconDevice.image = R.image.speaker()
      }
    return cell
  }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dv = self.deviceScannerViewModel.deviceScannerCellViewModels.value[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
            let vc = DetailsViewController()
        vc.title = dv.name
            navigationController?.pushViewController(vc, animated: true)
            print("tap")
        }
  
  
}


