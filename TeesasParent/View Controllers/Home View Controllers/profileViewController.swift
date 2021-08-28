//  profileViewController.swift
//  Teesas
//  Created by Appentus Technologies on 3/7/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.


import UIKit



class profileViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var tableViewPopOver:UITableView!
        
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var heightCollView: NSLayoutConstraint!
    @IBOutlet weak var viewPopOver:UIView!
    @IBOutlet weak var viewSelectCourse:UIView!
        
    @IBOutlet weak var heightPopOver:NSLayoutConstraint!
    @IBOutlet weak var xxxPopOver:NSLayoutConstraint!
    @IBOutlet weak var yyyPopOver:NSLayoutConstraint!
    
    @IBOutlet weak var titleLbl:UILabel!
    
    let arrImagesAvtar = ["Group 116611.png","Group 116621.png","Group 116631.png","Group 116641.png","Group 116651.png","Group 116661.png","Group 116671.png","Group 116681.png","Group 116691.png","Group 116701.png","Group 116711.png","Group 116721.png"]
    
    let arrHeader = ["Subscription Plan","Login Details","Child Details","Others"]
    let subscriptionArr = ["Learning App Last Sync"]
    let subscriptionArr1 = ["11 Jan 2020"]
    let subscriptionIconArr = ["Group 11549.png"]
    let loginDetailsArr = ["Registered Mobile Number","Parent Code"]
    let loginDetailsArr1 = ["+91123456789","123456"]
    let loginDetailsIconArr = ["Path 27067.png","Union 78.png"]
    let childDetailsArr = ["","","",""]
    let childDetailsArr1 = ["John Deo","Johndeo@gmail.com","Abc, Nigeria","11 Jan 2222"]
    let childDetailsIconArr = ["Union 80.png","Path 17121.png","Union 79.png","Group 7958.png"]
    let othersArr = ["",""]
    let othersArr1 = ["Contact us","Sign Out"]
    let othersIconArr = ["Path -1.png","Group 8050.png"]
    
    var arrSelectAvtar = [Bool]()
    
    let arrPopOver = ["Primary 6","Secondary School Entrance","Secondary (1st)"]
    var selectedPopOverArr = [Bool]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewPopup.alpha = 0.0
        for _ in 0..<self.arrImagesAvtar.count{
            self.arrSelectAvtar.append(false)
        }
        
        self.arrSelectAvtar[0] = true
        self.imageUser.image = UIImage(named: arrImagesAvtar[0])
            
        tableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc func hideKeyboard() {
        viewPopOver.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tableHeight = CGFloat(50*3)
        
        let xxxx = (self.view.frame.width-viewPopOver.frame.size.width)/2
        let yyyy = viewSelectCourse.frame.origin.y
        
        xxxPopOver.constant = xxxx
        yyyPopOver.constant = yyyy
        heightPopOver.constant = tableHeight
        
        var frameTable = tableViewPopOver.frame
        
        frameTable.size.height = tableHeight
        frameTable.size.width = viewPopOver.frame.size.width
        frameTable.origin.x = 0
        frameTable.origin.y = (heightPopOver.constant-tableHeight)/2+20
        tableViewPopOver.frame = frameTable
        
        viewPopOver.isHidden = true
        for _ in arrPopOver {
            selectedPopOverArr.append(false)
        }
    }
    
    @IBAction func editPhotoBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.viewPopup.alpha = 1.0
        }
    }
    
    @IBAction func okAvtarPopupBtn(_ sender: custom_button) {
        let index = self.arrSelectAvtar.firstIndex(of: true)
        self.imageUser.image = UIImage(named: self.arrImagesAvtar[index!])
        UIView.animate(withDuration: 0.3) {
            self.viewPopup.alpha = 0.0
        }
    }
    
    @IBAction func selectCourse(_ sender: UIButton) {
        viewPopOver.isHidden = false
    }
    
    @IBAction func back(_ sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension profileViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImagesAvtar.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avtarCollectionViewCell", for: indexPath) as! avtarCollectionViewCell
        cell.userImage.image = UIImage(named: self.arrImagesAvtar[indexPath.row])
        cell.selectedImage.alpha = self.arrSelectAvtar[indexPath.row] == true ? 1.0 : 0.0
        self.heightCollView.constant = collectionView.contentSize.height
        self.view.layoutIfNeeded()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3) - 15, height: (collectionView.frame.width / 3) - 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0..<self.arrSelectAvtar.count{
            self.arrSelectAvtar[i] = false
        }
        self.arrSelectAvtar[indexPath.row] = true
        self.collView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension profileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tableViewPopOver {
            return 40
        } else {
            return 90
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == tableViewPopOver {
            return 0
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if tableView == tableViewPopOver {
            
//        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellLearningSummary")
            
            let titleSection = cell?.viewWithTag(1) as! UILabel
            titleSection.text = arrHeader[section]
            
            return cell
//        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tableViewPopOver {
            return 1
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewPopOver {
            return arrPopOver.count
        } else {
            if section == 0 {
                return subscriptionArr.count
            } else if section == 1 {
                return loginDetailsArr.count
            } else if section == 2 {
                return childDetailsArr.count
            } else if section == 3 {
                return othersArr.count
            } else {
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewPopOver {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellPopOver") as! PopOverTableViewCell
                        
            cell.titleBtn?.tag = indexPath.row
            cell.titleBtn?.addTarget(self, action:#selector(titleColor(_:)), for: .touchUpInside)
            let titleColor = selectedPopOverArr[indexPath.row] ? "#449603" : "#888888"
            cell.titleBtn?.setTitleColor(hexStringToUIColor(hex:titleColor), for: .normal)
            cell.titleBtn?.setTitle(arrPopOver[indexPath.row], for: .normal)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCellTbl") as! HomeCellTbl
            
            cell.titleLbl.isHidden = false
            cell.buttonSelect.addTarget(self, action: #selector(buttonSelect(_:)), for: .touchUpInside)
            
            if indexPath.section == 0 {
                cell.titleLbl.text = subscriptionArr[indexPath.row]
                cell.subTitleLbl.text = subscriptionArr1[indexPath.row]
                cell.imgView.image = UIImage (named:subscriptionIconArr[indexPath.row])
            } else if indexPath.section == 1 {
                cell.titleLbl.text = loginDetailsArr[indexPath.row]
                cell.subTitleLbl.text = loginDetailsArr1[indexPath.row]
                cell.imgView.image = UIImage (named:loginDetailsIconArr[indexPath.row])
            } else if indexPath.section == 2 {
                cell.titleLbl.text = childDetailsArr[indexPath.row]
                cell.subTitleLbl.text = childDetailsArr1[indexPath.row]
                cell.titleLbl.isHidden = true
                cell.imgView.image = UIImage (named:childDetailsIconArr[indexPath.row])
            } else if indexPath.section == 3 {
                cell.titleLbl.text = othersArr[indexPath.row]
                cell.subTitleLbl.text = othersArr1[indexPath.row]
                cell.titleLbl.isHidden = true
                cell.imgView.image = UIImage (named:othersIconArr[indexPath.row])
            }
            
            return cell
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            hideKeyboard()
        }
    }
    
//    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
//        if scrollView == tableView {
//            hideKeyboard()
//        }
//    }
    
    @IBAction func buttonSelect(_ sender:UIButton) {
        let buttonPosition = sender.convert(CGPoint.zero, to:tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)!
        
        if indexPath.section == 3 {
            if indexPath.row == 0 {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "contactUsViewController") as! contactUsViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func titleColor(_ sender:UIButton) {
        titleLbl.text = arrPopOver[sender.tag]
        
        for i in 0..<selectedPopOverArr.count {
            if i == sender.tag {
                selectedPopOverArr[i] = true
            } else {
                selectedPopOverArr[i] = false
            }
        }
        tableViewPopOver.reloadData()
    }
    
}


