//
//  OnboardingViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 16.05.22.
//
import Rswift
import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        slides = [OnboardingSlide(title: "FIND YOUR LOST DEVICES", image: UIImage(named: "OnboardingFirst")!),
                  OnboardingSlide(title: "DETECT DEVICES NEAR YOU", image: UIImage(named: "OnboardingSecond")!),
                  OnboardingSlide(title: "MAP VIEW WITH LOCATION", image: UIImage(named: "OnboardingThird")!)
                                  ]
        
        collectionView.delegate = self
        collectionView.dataSource = self
      

    }

    @IBAction func continueBtnClick(_ sender: Any) {
        
        if currentPage == slides.count - 1 {
            print("Go to next View")
            let controller = storyboard?.instantiateViewController(withIdentifier: "SubscribeViewController") as! UIViewController
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        } else {
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        print("Click Button")
        }
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.indentifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setUpSlideContent(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
