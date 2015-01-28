//
//  Note.swift
//  Notes
//
//  Created by Nidhi Shah.

import UIKit

var allNotes:[Note] = []
var currentNoteIndex:Int = -1
var noteTable: UITableView?


let kAllNotes:String = "notes"


class Note: NSObject {
    var date:String
    var note:String
    
  override  init() {
        date = NSDate().description
        note = ""
    }
    
    
    func dictionary() -> NSDictionary {
        return["note":note,"date":date]
    }
    
    class func saveNotes () {
        var aDictionaries:NSMutableArray = []
        for var i:Int = 0; i < allNotes.count; i++ {
            aDictionaries.addObject(allNotes[i].dictionary())
        }
        //NSUserDefaults.standardUserDefaults().setObject(aDictionaries, forKey: kAllNotes)
       aDictionaries.writeToFile(filePath(), atomically: true)
    }
    
    
    class func loadNotes() {
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        //var savedData: [NSDictionary]? = defaults.objectForKey(kAllNotes) as? [NSDictionary]
        
        
        var savedDadata:NSArray? = NSArray(contentsOfFile: filePath())
        if let data:NSArray = savedDadata {
            for var i:Int = 0; i < data.count; i++ {
                var n:Note = Note()
                n.setValuesForKeysWithDictionary(data[i] as NSDictionary)
              
            }
        }
    }
    class func filePath() -> String {
        var d:[String]? =
            NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]
        
        if let directories: [String] = d {
            var docsDirectory:String = directories [0]
            var path:String = docsDirectory.stringByAppendingPathComponent("\(kAllNotes).notes")
            return path;
            
            
        }
        return ""
    }
    
    
}
