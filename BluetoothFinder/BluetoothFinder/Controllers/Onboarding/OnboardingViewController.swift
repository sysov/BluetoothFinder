//
//  OnboardingViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 9.06.22.
//

import Foundation
import UIKit
import StoreKit

final class OnboardingViewController: UIViewController {
    
    // MARK: OnboardingViewController variables
    
    private let app = UIApplication.shared.delegate
    private var currentIndex: IndexPath = .init(index: 0)
    
    lazy var collectionView = CollectionView(
        delegate: self,
        dataSource: self
    )
    
    lazy var stackView = StackView(axis: .horizontal)
    lazy var closeButton = Button(style: .close, nil)
    lazy var continueButton = Button(style: ._continue, "Continue")
    lazy var termsOfUseButton = Button(style: .link, "Terms of service")
    lazy var privacyPolicyButton = Button(style: .link, "Privacy Policy")
    lazy var restorePurchaseButton = Button(style: .link, "and")
    
    lazy var separatorOne = UILabel()
    lazy var separatorTwo = UILabel()
    
    // MARK: OnboardingViewControllerViewDidLoad
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
          // Hide the Navigation Bar
          self.navigationController?.setNavigationBarHidden(true, animated: true)
        navigationItem.hidesBackButton = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
           // Show the Navigation Bar
           self.navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.hidesBackButton = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //    func rateApp() {
    //        SKStoreReviewController.requestReview()
    //    }
}


// MARK: OnboardingViewController SetUp views
extension OnboardingViewController {
    
    func setupView() {
        termsOfUseButton.setTitleColor(UIColor.systemBlue, for: .normal)
        restorePurchaseButton.setTitleColor(UIColor.gray, for: .normal)
        privacyPolicyButton.setTitleColor(UIColor.systemBlue, for: .normal)
        
        separatorOne.textAlignment = .center
        separatorOne.textColor = .black
        separatorOne.font = R.font.gilroySemibold(size: 12)
        
        separatorTwo.textAlignment = .center
        separatorTwo.textColor = .black
        separatorTwo.font = R.font.gilroySemibold(size: 12)
        
        closeButton.isHidden = true
        closeButton.layer.zPosition = 10
        
        // MARK: OnboardingViewController SetUp target
        closeButton.addTarget(self, action: #selector(closeOnboarding), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        termsOfUseButton.addTarget(self, action: #selector(getTermsOfUse), for: .touchUpInside)
        privacyPolicyButton.addTarget(self, action: #selector(getPrivacyPolicy), for: .touchUpInside)
        restorePurchaseButton.addTarget(self, action: #selector(getRestorePurchase), for: .touchUpInside)
        
        collectionView.register(FirstListView.self, forCellWithReuseIdentifier: FirstListView.identifier)
        collectionView.register(SecondListView.self, forCellWithReuseIdentifier: SecondListView.identifier)
        collectionView.register(ThirdListView.self, forCellWithReuseIdentifier: ThirdListView.identifier)
        collectionView.register(SubscribeView.self, forCellWithReuseIdentifier: SubscribeView.identifier)
        
        view.addSubview(collectionView)
        view.addSubview(closeButton)
        view.addSubview(continueButton)
        view.addSubview(stackView)
        stackView.addArrangedSubview(termsOfUseButton)
        stackView.addArrangedSubview(separatorOne)
        stackView.addArrangedSubview(restorePurchaseButton)
        stackView.addArrangedSubview(separatorTwo)
        stackView.addArrangedSubview(privacyPolicyButton)
        
        // MARK: OnboardingViewController SetUp constrains
        let constraints = [
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            continueButton.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -15),
            continueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: OnboardingViewController button actions
extension OnboardingViewController {
    
    @objc func closeOnboarding() {
        let vc = DeviceScannerViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func nextPage() {
        if currentIndex.row < 3 {
            collectionView.scrollToItem(at: IndexPath(arrayLiteral: 0, currentIndex.row + 1), at: .centeredHorizontally, animated: true)
        } else if currentIndex.row == 4 {
            closeOnboarding()
           
        } else {
            closeOnboarding()
        }
    }
    
    @objc func getTermsOfUse() {
        print("Terms of use")
        let url = URL(string: "https://www.mindateq.io/terms-of-use")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    @objc func getPrivacyPolicy() {
        print("Privacy policy")
        let url = URL(string: "https://www.mindateq.io/privacy-policy")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    @objc func getRestorePurchase() {
        
    }
}


// MARK: OnboardingViewController view datasource
extension OnboardingViewController: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        1
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var slide: String
        
        switch indexPath.row {
        case 0:
            slide = FirstListView.identifier
            termsOfUseButton.isHidden = true
            privacyPolicyButton.isHidden = true
            restorePurchaseButton.isHidden = true
            continueButton.isHidden = false
        case 1:
            slide = SecondListView.identifier
            termsOfUseButton.isHidden = true
            privacyPolicyButton.isHidden = true
            restorePurchaseButton.isHidden = true
            continueButton.isHidden = false
        case 2:
            slide = ThirdListView.identifier
            termsOfUseButton.isHidden = true
            privacyPolicyButton.isHidden = true
            restorePurchaseButton.isHidden = true
            continueButton.isHidden = false
        case 3:
            slide = SubscribeView.identifier
            privacyPolicyButton.isHidden = false
            termsOfUseButton.isHidden = false
            restorePurchaseButton.isHidden = false
            continueButton.isHidden = true
        default:
            slide = FirstListView.identifier
            termsOfUseButton.isHidden = true
            privacyPolicyButton.isHidden = true
            restorePurchaseButton.isHidden = true
        }
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: slide, for: indexPath)
        return item
    }
    
}

// MARK: OnboardingViewController view delegate
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = collectionView.frame.width
        let itemHeight = collectionView.frame.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        currentIndex = indexPath
        //        if currentIndex.row == 1 {
        //            rateApp()
        //        }
        if currentIndex.row == 3 {
            closeButton.isHidden = false
        } else {
            closeButton.isHidden = true
        }
        
        UIView.transition(with: closeButton, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: { _ in })
    }
}

