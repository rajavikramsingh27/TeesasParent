//
//  HomeViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 03/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import HCLineChartView
import PanModal

class HomeViewController: UIViewController {

    @IBOutlet weak var chartView: HCLineChartView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgUser: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLineChart()
        
        imgUser.layer.cornerRadius = imgUser.frame.height/2
        imgUser.clipsToBounds = true
        
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        NotificationCenter.default.addObserver(self, selector: #selector(self.pushFromHome(_:)), name: NSNotification.Name("pushFromHome"), object: nil)
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
   
    @objc func pushFromHome(_ sender:NSNotification){
        let object = sender.object as! String
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: object))!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func viewGrowthBtn(_ sender: UIButton) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "reportsViewController") as! reportsViewController
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func viewProfile(_ sender:UIButton){
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! profileViewController
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
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
        cell.buttonSelect.addTarget(self, action: #selector(selectTeesasPlace(_:)), for: .touchUpInside)
//        cell.titleLbl.text = indexPath.row == 2 ? "Teesas Place" : "Share with friends"

        return cell
    }
    
    @objc func selectTeesasPlace(_ sender:UIButton){
//        if sender.tag == 2{
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "teesasPlaceViewController") as! teesasPlaceViewController
//                   self.navigationController?.pushViewController(vc, animated: true)
//        }else if sender.tag == 3{
//            let shareText = "Preparing for exams is so much more interesting with the Teesas app.  Personalized learning helped me master my fundamentals. Download now for free and learn from best teachers!"
//            let textToShare = [ shareText ]
//            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
//            activityViewController.popoverPresentationController?.sourceView = self.view
//            self.present(activityViewController, animated: true, completion: nil)
//        }
    }
    
}
