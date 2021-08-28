//  bookmarkViewController.swift
//  Teesas
//  Created by Ayush Pathak on 17/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.


import UIKit
import KUIPopOver
import HCLineChartView
import PanModal

class bookmarkViewController: UIViewController {
    @IBOutlet weak var subjectCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var chartView: HCLineChartView!
    @IBOutlet weak var detailsImg:UIImageView!
    @IBOutlet weak var topicLearnedImg:UIImageView!
    @IBOutlet weak var learningTimeImg:UIImageView!
    
    var popOverViewController = DefaultPopOverViewController()
    
    var selectedArrSubjects = [true,false,false,false]//,false,false,false,false,false,false]
    var arrItemsTableTypeIsQuestion = [true,false,true,true]//,false,false,true,true,false,true]
    
    var arrSubjectSelect = ["select-1.png","select-2.png","select-3.png","select-4.png"]
    var arrSubjectUnselect = ["unselect-1.png","unselect-2.png","unselect-3.png","unselect-4.png"]
    var arrSubjectName = ["Mathematics","Physics","Chemistry","Biology"]
        
    let arrChartLineColor = ["0084F9","FF672C","1DA430","C01A93"]
    let arrDetailsImg = ["learning-1.png","learning-2.png","learning-3.png","learning-4.png"]
    let arrTopicLearnedImg = ["tl-1.png","tl-2.png","tl-3.png","tl-4.png"]
    let arrLearningTimeImg = ["lt-1.png","lt-2.png","lt-3.png","lt-4.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLineChart()
        
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        
        NotificationCenter.default.addObserver(self, selector: #selector(btnFilterActions(_:)), name: NSNotification.Name("selectFilter"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeObserversThis(_:)), name: NSNotification.Name("removeAllObservers"), object: nil)
    }
    
    func setLineChart() {
        self.chartView.xElements = [10,11,12,13,14,15,16]
        self.chartView.yElements = [00,25,35,75,100]
        self.chartView.drawChart()
    }

    
    @objc func removeObserversThis(_ sender:NSNotification){
           NotificationCenter.default.removeObserver(self)
       }
      
    @IBAction func filterBtn(_ sender: custom_button) {
        popOverViewController = DefaultPopOverViewController()
        popOverViewController.preferredContentSize = CGSize(width: 180, height: 170)
        popOverViewController.popoverPresentationController?.sourceView = sender
        let customView = UINib(nibName: "custom_filter_popup", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! custom_filter_popup
        customView.frame.size = CGSize(width: 180, height: 180)
        customView.frame.origin = CGPoint(x: 0, y: 0)
        popOverViewController.view.addSubview(customView)
        popOverViewController.popoverPresentationController?.sourceRect = sender.bounds
        present(popOverViewController, animated: true, completion: nil)
    }
    
    @objc func btnFilterActions(_ sender:NSNotification){
        print("\(sender.object as! Int)")
        dismiss(animated: true, completion: nil)
    }
}

extension bookmarkViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedArrSubjects.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookmarkSubjectCell", for: indexPath) as! bookmarkSubjectCell

        cell.imageSubject.image = UIImage (named:self.selectedArrSubjects[indexPath.row] ? arrSubjectSelect[indexPath.row] : arrSubjectUnselect[indexPath.row])
        cell.titleLbl.text = arrSubjectName[indexPath.row]
        
//        cell.titleLbl.textColor = self.selectedArrSubjects[indexPath.row] == true ? UIColor.black : hexStringToUIColor(hex: "#B8B8B8")
//        cell.imageSubject.layer.borderColor = self.selectedArrSubjects[indexPath.row] == true ? UIColor.clear.cgColor : hexStringToUIColor(hex: "#B8B8B8").cgColor
//        cell.imageSubject.layer.borderWidth = 1.0
//        cell.innerImageView.alpha = self.selectedArrSubjects[indexPath.row] == true ? 0.0 : 1.0
//        cell.titleLbl.text = indexPath.row == 0 ? "All" : "Physics"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont(name: "Montserrat-Medium", size: 14.0)!
        let widthFinal = width(withConstrainedHeight: 40, font: font, str:arrSubjectName[indexPath.row]) + 15// 25
        return CGSize(width: (widthFinal < 70) ? 70 : widthFinal , height: 81)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0..<selectedArrSubjects.count{
            selectedArrSubjects[i] = false
        }
        selectedArrSubjects[indexPath.row] = true
        self.subjectCollectionView.reloadData()
                
        chartView.chartLineColor = hexStringToUIColor(hex:arrChartLineColor[indexPath.row])
        chartView.underLineChartGradientTopColor = hexStringToUIColor(hex:arrChartLineColor[indexPath.row])
        chartView.drawChart()
        
        detailsImg.image = UIImage (named: arrDetailsImg[indexPath.row])
        topicLearnedImg.image = UIImage (named: arrTopicLearnedImg[indexPath.row])
        learningTimeImg.image = UIImage (named: arrLearningTimeImg[indexPath.row])
                
        selectedDetailsImg = UIImage (named:"bgDetails\(indexPath.row+1).png")
        selectedBGColorBottomLine = hexStringToUIColor(hex:bgColorBottomLineArr[indexPath.row])
        
        tableView.reloadData()
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont,str:String) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = str.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
}

extension bookmarkViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLearningSummary")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCellTbl") as! HomeCellTbl

        cell.buttonSelect.tag = indexPath.row
//        cell.buttonSelect.addTarget(self, action: #selector(selectTeesasPlace(_:)), for: .touchUpInside)
//        cell.titleLbl.text = indexPath.row == 2 ? "Teesas Place" : "Share with friends"

        return cell
    }
    
    @IBAction func showDetailsBtn(_ sender:UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
