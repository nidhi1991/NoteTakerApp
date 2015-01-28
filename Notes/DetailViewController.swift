//
//  DetailViewController.swift
//  Notes
//
//  Created by Nidhi Shah.

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tView: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tView.text = allNotes[currentNoteIndex].note
        tView.becomeFirstResponder()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if tView.text == "" {
            allNotes.removeAtIndex(currentNoteIndex)
        }
        else {
            allNotes[currentNoteIndex].note = tView.text
        }
        Note.saveNotes()
        noteTable?.reloadData()
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

