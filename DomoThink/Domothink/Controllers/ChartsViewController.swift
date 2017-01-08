//
//  ChartsViewController.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 19/11/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit
import Charts

class ChartsViewController: UIViewController {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet var chartsView: LineChartView!
    @IBOutlet weak var humidityChart: LineChartView!
    
    var timeT: [String]!
    var units: [Double]!
    var unitsHumidity: [Double]!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        timeT = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
        units = [25, -4, -6, 3, -12, -20, 4, -18, 2, 4, 5, 24]
        unitsHumidity = [25, 4, 6, 30, 12, 20, 4, 18, 20, 40, 50, 24]
        setChart(timeT, values: units)
        setHumidityChart(timeT, values: unitsHumidity)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setHumidityChart(dataPoints: [String], values: [Double]) {
        
        humidityChart.noDataText = "You need to provide data for the chart."
        humidityChart.descriptionText = "Humidity"
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(yVals: dataEntries, label: "%/H")
        let chartData = LineChartData(xVals: timeT, dataSet: chartDataSet)
        humidityChart.data = chartData
        
        humidityChart.rightAxis.maxWidth = 25
        humidityChart.rightAxis.minWidth = -25
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        chartsView.noDataText = "You need to provide data for the chart."
        chartsView.descriptionText = "Temperature"
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        

        let chartDataSet = LineChartDataSet(yVals: dataEntries, label: "°C/H")
        let chartData = LineChartData(xVals: timeT, dataSet: chartDataSet)
        chartsView.data = chartData
        
        chartsView.rightAxis.maxWidth = 25
        chartsView.rightAxis.minWidth = -25
        
        
    }



}
