//
//  TranslationVC_DataModel.swift
//  Pronounciation
//
//  Created by Mushtaque Ahmed on 12/12/17.
//  Copyright © 2017 Mushtaque Ahmed. All rights reserved.
//

import UIKit

class TranslationVC_DataModel: NSObject, UITableViewDataSource,UITableViewDelegate {
    
    
    
    //var correctionView: UITableView!
    var predictionData : Pronunciation_Prediction = Pronunciation_Prediction.init()
   
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return (predictionData.words_Result?.count)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var word_Result: Word_Prediction  =  predictionData.words_Result![section] as! Word_Prediction
        return max((word_Result.predicted_phonemes?.count)!, (word_Result.word_phonemes?.count)!)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
        headerView.backgroundColor = UIColor.white
        let menuHeaderLabel = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.frame.size.width, height: 28))
        var word_Result: Word_Prediction  =  predictionData.words_Result![section] as! Word_Prediction
        menuHeaderLabel.text = word_Result.word
        menuHeaderLabel.font = UIFont(name: "Futura-Bold", size: 18.0)
        headerView.addSubview(menuHeaderLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
         let cell = tableView.dequeueReusableCell(withIdentifier: "report", for: indexPath) as! ReportCell
        var word_Result: Word_Prediction  =  predictionData.words_Result![indexPath.section] as! Word_Prediction
        cell.character.text = ""
        if(word_Result.predicted_phonemes?.indices.contains(indexPath.row))!{
        cell.predicted.text = word_Result.predicted_phonemes?[indexPath.row]
        }
        
        if(word_Result.word_phonemes?.indices.contains(indexPath.row))!{
        cell.actual.text =  word_Result.word_phonemes?[indexPath.row]
        }
        
        return cell
    }
    

}
