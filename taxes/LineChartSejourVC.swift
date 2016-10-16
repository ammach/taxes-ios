//
//  LineChartSejourVC.swift
//  taxes
//
//  Created by adhoc on 27/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import UIKit
import Charts

class LineChartSejourVC: UIViewController {
    
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    var unitsSold1=[Double]()
    var unitsSold2=[Double]()

    override func viewDidLoad() {
        
        let url=NSURL(string: "http://"+Configuration.ADDR_IP+":28075/taxe3_new/webresources/taxesejourtrimistrielle/search/2015/2016/2/2/1")
    
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            if let content=data {
                do{
                let jsonArray = try NSJSONSerialization.JSONObjectWithData(content, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                    
                    for (index,item) in jsonArray.enumerate() {
                    
                        let valTrim1=item["trimestre1"] as! Double
                        let valTrim2=item["trimestre2"] as! Double
                        let valTrim3=item["trimestre3"] as! Double
                        let valTrim4=item["trimestre4"] as! Double
                        
                        if index==0 {
                            self.unitsSold1.append(valTrim1)
                            self.unitsSold1.append(valTrim2)
                            self.unitsSold1.append(valTrim3)
                            self.unitsSold1.append(valTrim4)
                        }
                        else{
                            self.unitsSold2.append(valTrim1)
                            self.unitsSold2.append(valTrim2)
                            self.unitsSold2.append(valTrim3)
                            self.unitsSold2.append(valTrim4)
        
                            
                            let months=["trim1","trim2","trim3","trim4"]
                            
                            var dataEntries2 : [ChartDataEntry] = []
                            for i in 0..<months.count {
                                let dataEntry = ChartDataEntry(value: self.unitsSold2[i], xIndex: i)
                                dataEntries2.append(dataEntry)
                            }
                            print(dataEntries2)
                            
                            var dataEntries1 : [ChartDataEntry] = []
                            for i in 0..<months.count {
                                let dataEntry = ChartDataEntry(value: self.unitsSold1[i], xIndex: i)
                                dataEntries1.append(dataEntry)
                            }
                            print(dataEntries1)
                            
                            
                            let linechartDataSet1 = LineChartDataSet(yVals: dataEntries1, label: "première année")
                            let lineChartDataSet2 = LineChartDataSet(yVals: dataEntries2, label: "deuxième année")
                            linechartDataSet1.colors=[UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
                            linechartDataSet1.circleColors=[UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
                            
                            
                            let lineChartData = LineChartData(xVals: months, dataSet: lineChartDataSet2)
                            lineChartData.addDataSet(linechartDataSet1)
                            dispatch_async(dispatch_get_main_queue(), {
                                self.lineChartView.data = lineChartData
                            })
                        }
                    }
                }catch{}
            }
        }.resume()
        
    }
    
  
}
