//  ActivityViewController.swift
//  TeesasParent
//  Created by iOS-Appentus on 24/March/2020.
//  Copyright © 2020 appentus. All rights reserved.


import UIKit


class ActivityViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let arrChartLineColor = ["#009FF5","#FF7D2F","#9526AD","#47BA43","#009FF5","#FF7D2F","#9526AD","#47BA43"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}



extension ActivityViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! activityTableViewCell
        
        cell.circleView.backgroundColor = hexStringToUIColor(hex:arrChartLineColor[indexPath.row])
        cell.circle1View.backgroundColor = hexStringToUIColor(hex:arrChartLineColor[indexPath.row])
        
        return cell
    }
    
}
