//
//  walkthroughViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 02/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class walkthroughViewController: UIViewController {
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var pageControl: PageControl!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var nextBtnLbl: UILabel!
    
    @IBOutlet weak var widthBtnNext: NSLayoutConstraint!
    
    let imagesArr : [UIImage?] = [#imageLiteral(resourceName: "wt-1.png"),#imageLiteral(resourceName: "wt-2.png"),#imageLiteral(resourceName: "wt-3.png")]
    let titleArr = ["Learning Progress","Understand Strength & Weakness","Motivate & Help Them Grow"]
    let subTitleArr = ["Step by step learning progress of your child.","Gain unique insights into your child's strengths and improvement opportunities.","Get real time advise on how to keep your child motivated and engaged with their studies."]
    var indexPath = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    func initViews() {
        self.collView.isPagingEnabled = true
        self.pageControl.numberOfPages = self.imagesArr.count
        
        let layout = AnimatedCollectionViewLayout()
        layout.animator = ParallaxAttributesAnimator()
        layout.scrollDirection = .horizontal
        collView.collectionViewLayout = layout
        collView.isScrollEnabled = true
    }
    
    @IBAction func skipButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        if nextBtnLbl.text == "Next"{
            self.collView.scrollToItem(at: IndexPath(item: indexPath+1, section: 0), at: .right, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension walkthroughViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "walkthroughCell", for: indexPath) as! walkthroughCell
        cell.imageBack.image = imagesArr[indexPath.item]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.collView.frame.width, height: self.collView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = collView.contentOffset
        visibleRect.size = collView.bounds.size
        let visiblePoint = CGPoint(x: CGFloat(visibleRect.midX), y: CGFloat(visibleRect.midY))
        let visibleIndexPath: IndexPath? = collView.indexPathForItem(at: visiblePoint)
        indexPath = visibleIndexPath!.row
        titleLbl.text = titleArr[visibleIndexPath!.row]
        subTitleLbl.text = subTitleArr[visibleIndexPath!.row]
        self.nextBtnLbl.text = (visibleIndexPath!.row == 2) ? "Get Started" : "Next"
        self.widthBtnNext.constant = (visibleIndexPath!.row == 2) ? 120 : 100
        self.pageControl.currentPage = visibleIndexPath!.row
    }
    
}
