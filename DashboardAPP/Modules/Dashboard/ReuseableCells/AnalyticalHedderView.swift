//
//  AnalyticalHedderView.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import UIKit
import Charts

protocol HeaderViewProtocol: NSObject{
    func reloadTableViewData()
}

class AnalyticalHedderView: UIView {

    @IBOutlet weak var greetingLBL: UILabel!
    @IBOutlet weak var usernameLBL: UILabel!
    @IBOutlet weak var overViewLBL: UILabel!
    @IBOutlet weak var chartDateLBL: UILabel!
    @IBOutlet weak var recentBrnLblBL: UILabel!
    @IBOutlet weak var topclickBTNLBL: UILabel!
    @IBOutlet weak var topLinkBtn: UIButton!
    @IBOutlet weak var recentBtn: UIButton!
    @IBOutlet weak var chartView: LineChartView!
    weak var delegate: HeaderViewProtocol!
    var isTopLinkLoad : Bool = true
    
    @IBOutlet weak var analyticCollectionView: UICollectionView!
    var analyticData : [FlowAnalytic]?
    var overAllClickChart : [String:Int]?
    
    // MARK: - INIT
       override func awakeFromNib() {
           setupFontforLabel()
           setupCollectionView()
           setSegmentBtn(activeBtn: topLinkBtn, activeLbl: topclickBTNLBL, inactiveBtn: recentBtn, inactiveLbl: recentBrnLblBL)
       }
       
       override func layoutSubviews() {
       }
    
    @IBAction func topLinkAction(sender:UIButton?){
        setSegmentBtn(activeBtn: topLinkBtn, activeLbl: topclickBTNLBL, inactiveBtn: recentBtn, inactiveLbl: recentBrnLblBL)
        isTopLinkLoad = true
        if delegate != nil{
            delegate.reloadTableViewData()
        }
    }
    @IBAction func recentLinkAction(sender:UIButton?){
        setSegmentBtn(activeBtn: recentBtn, activeLbl: recentBrnLblBL, inactiveBtn: topLinkBtn, inactiveLbl: topclickBTNLBL)
        isTopLinkLoad = false
        if delegate != nil{
            delegate.reloadTableViewData()
        }
    }
    
    func setupFontforLabel(){
        greetingLBL.setFigFontReqular(size: 16)
        usernameLBL.setFigFontReqular(size: 24)
        chartDateLBL.setFigFontReqular(size: 9)
        overViewLBL.setFigFontReqular(size: 16)
        recentBrnLblBL.setFigFontReqular(size: 16)
        topclickBTNLBL.setFigFontReqular(size: 16)
        greetingLBL.text = Utils.getLocalTimeGreeting()
        usernameLBL.text = Constants.UserCosntants.name
    }
    
    func setupCollectionView(){
        analyticCollectionView.delegate = self
        analyticCollectionView.dataSource = self
        analyticCollectionView.register(UINib(nibName: "MetricCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MetricCollectionViewCell")
        
    }
    func reloadanalytic(){
        analyticCollectionView.reloadData()
    }
    func setupChart(){
        chartView.rightAxis.enabled = false
        var dataEntries: [ChartDataEntry] = []
         
       
        guard let allKeys = overAllClickChart?.keys else {
            // Handle the case where `overAllClickChart` or its keys are nil
            return
        }

        let monthsSorted = Utils.getSortedMonths(monthNames: allKeys.sorted())

        for (index, key) in monthsSorted.enumerated() {
            guard let value = overAllClickChart?[key] else {
                continue // Skip to the next iteration if the value is nil
            }
            
            let dataEntry = ChartDataEntry(x: Double(index), y: Double(value))
            dataEntries.append(dataEntry)
        }

        
        let dataSet = LineChartDataSet(entries: dataEntries, label: "Clicks")
        dataSet.drawIconsEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.drawFilledEnabled = false
        let blueGradient = UIColor(red: 14/255, green: 111/255, blue: 255/255, alpha: 1)
        let blue0Alpha = UIColor(red: 14/255, green: 111/255, blue: 255/255, alpha: 0)

        let gradientColors = [blue0Alpha.cgColor,blueGradient.cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)

        // Set the gradient fill for the dataset
        dataSet.fill = LinearGradientFill(gradient: gradient!,angle: 90)
//        Fill.fillWithLinearGradient(gradient!, angle: 90.0)

        // Customize other appearance properties as needed
        dataSet.drawIconsEnabled = false // Hide the dots
        dataSet.drawValuesEnabled = false // Hide the values
        dataSet.drawFilledEnabled = true


        dataSet.setColor(UIColor(red: 14/255, green: 111/255, blue: 255/255, alpha: 1)) // Customize line color
        dataSet.lineWidth = 2.0 // Customize line width
        dataSet.circleRadius = 0.0 // Customize circle size

        let lineChartData = LineChartData(dataSet: dataSet)
        let lblColor = UIColor(red: 153/255, green: 156/255, blue: 160/255, alpha: 1)
        let xAxis = chartView.xAxis
        
        xAxis.valueFormatter = IndexAxisValueFormatter(values: monthsSorted)
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = lblColor
        
        xAxis.granularity = 1
        xAxis.axisMinimum = 0
        xAxis.axisMaximum = Double(overAllClickChart?.keys.count ?? 0) - 1

        let yAxis = chartView.leftAxis
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 100
        yAxis.labelTextColor = lblColor


        chartView.data = lineChartData
        chartView.notifyDataSetChanged()

    }
    
    func setSegmentBtn(activeBtn:UIButton, activeLbl: UILabel, inactiveBtn:UIButton, inactiveLbl: UILabel){

        activeBtn.backgroundColor = UIColor(red: 14/255, green: 111/255, blue: 255/255, alpha: 1)
        activeLbl.textColor = .white
        activeBtn.cornerRadius = activeBtn.frame.size.height / 2

        inactiveBtn.backgroundColor = .clear
        inactiveBtn.cornerRadius = inactiveBtn.frame.size.height / 2
        inactiveLbl.textColor = .lightGray
    }
}


extension AnalyticalHedderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return analyticData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MetricCollectionViewCell", for: indexPath) as! MetricCollectionViewCell
        cell.setDatatoCell(itemObj: analyticData?[indexPath.row])
      
        return cell
    }
    
    
}

extension AnalyticalHedderView:ChartViewDelegate{
}
