//
//  statisticViewController.swift
//  ToDoListD
//
//  Created by Reenad gh on 17/05/1443 AH.
//

import UIKit
import SwiftUI
import Charts
class statisticViewController: UIViewController , ChartViewDelegate {

    @IBOutlet weak var pieChartView: UIView!
    
    var chartView = UIView()
    var pieChart = PieChartView()
    var lineChart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chartView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        chartView.addSubview(pieChart)
        pieChartView.addSubview(chartView)
        myPieChart()
     


    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func myPieChart() {
        countNumOfTask()
    
        pieChart.frame = CGRect(x: 0, y: 0, width: self.chartView.frame.width, height: self.chartView.frame.width)
        var entries = [PieChartDataEntry]()
        entries.append(PieChartDataEntry(  value: Double(countNumOfTask().0) ,label: "Completed"))
        
        entries.append(PieChartDataEntry(  value: Double(countNumOfTask().1) ,label: "UnCompleted"))
        

        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.colors = [.systemCyan, .blue, .purple, .systemCyan, .blue, .purple]
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        //pieChart.chartDescription?.enabled = false
        //pieChart.drawHoleEnabled = false //To Add Hole in the Middle
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = false //For Rotating The Chart
        //pieChart.isUserInteractionEnabled = false //Used For Clicking on the chart
        //pieChart.legend.enabled = false //Used To Display Uder Data
        pieChart.drawSlicesUnderHoleEnabled = false
        //pieChart.drawEntryLabelsEnabled = false //Rwiting Entry Label in slices
        pieChart.usePercentValuesEnabled = true
    }
    
    
    func countNumOfTask()->(Int,Int){
        var numOfCompletedTask = 0
        var numOfUnCompletedTask = 0

        for task in TaskList {
            if task.status! == "Completed" {
                print(task.status!)

                numOfCompletedTask = numOfCompletedTask+1
            }else{
                print(task.status!)

                numOfUnCompletedTask = numOfUnCompletedTask+1

            }
   }
        print(numOfCompletedTask)
        
      return (numOfCompletedTask , numOfUnCompletedTask)
        
    }
    
}
