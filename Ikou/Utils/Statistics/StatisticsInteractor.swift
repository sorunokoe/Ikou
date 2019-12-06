//
//  StatisticsFacade.swift
//  Ikou
//
//  Created by Salgara on 12/6/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import Moya

protocol StatisticsFacadeProtocol: class {
    var statsItems: [StatItem] { get }
    
    func getStatBy(label: String) -> [StatItem]
    func getLabels() -> [String]
    func getHeight(index: Int) -> CGFloat
    func getName(name: String) -> String
    func getDay(index: Int) -> String
    func getDate(index: Int) -> String
}

class StatisticsFacade: StatisticsFacadeProtocol{

    internal var statsItems: [StatItem]
    private var filtredItems = [StatItem]()
    
    private let weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    init(statsItems: [StatItem]){
        self.statsItems = statsItems
    }
    
    func getStatBy(label: String) -> [StatItem]{
        filtredItems = statsItems.filter{ $0.name == label }
        return filtredItems
    }
    func getLabels() -> [String]{
        return statsItems.map{ return $0.name}
    }
    func getHeight(index: Int) -> CGFloat{
        var maxValueOfChart = 0
        filtredItems.forEach {
            if maxValueOfChart < $0.value{
                maxValueOfChart = $0.value
            }
        }
        let item = filtredItems[index]
        let itemProcent = Double(item.value)/100.0
        let maxProcent = Double(maxValueOfChart)/100.0
        let height = CGFloat((itemProcent/maxProcent)*200.0)
        return height
    }
    func getName(name: String) -> String{
        return name.split(separator: "_").joined(separator: " ").capitalized
    }
    func getDay(index: Int) -> String {
        let statItem = filtredItems[index]
        let weekDay = TimeAndDateHelper.shared.getDayOfWeek(statItem.date)
        return weekDays[weekDay ?? 0]
    }
    func getDate(index: Int) -> String {
        let statItem = filtredItems[index]
        return TimeAndDateHelper.shared.getMonthAndDay(statItem.date)
    }
    
}
