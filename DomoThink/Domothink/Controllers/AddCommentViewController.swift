//
//  AddCommentViewController.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 12/11/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class AddCommentViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var authorField: UITextField!
    @IBOutlet weak var ratePicker: UIPickerView!
    @IBOutlet weak var commentField: UITextView!
    private var selectedRate: Float!
    @IBOutlet weak var sendingComment: UIActivityIndicatorView!

    var pickerDataR: [Float] = []
    
    var plugin: StorePlugin!
    var commentPlugin: StoreComment!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerDataR = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0]
        ratePicker.delegate = self
        ratePicker.dataSource = self
        sendingComment.hidden = true
        if (commentPlugin != nil) {
            authorField.text = commentPlugin.getAuthor()
            ratePicker.selectRow(Int(commentPlugin.getRate()), inComponent: 0, animated: true)
            commentField.text = commentPlugin.getComment()
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataR.count
    }
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(pickerDataR[row])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedRate = pickerDataR[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "saveCommentSegue" {
            if (commentPlugin != nil) {
                LibraryAPI.sharedInstance.modifyStoreComment(commentPlugin.getId(), keyLoginHash: commentPlugin.getKeyLoginHash(), comment: commentField.text) { (result) -> () in
                    //add a nslocalise
                    print(result, terminator: "")
                }
            } else {
                let keyUser = (String(LibraryAPI.sharedInstance.getUser().getId()) + LibraryAPI.sharedInstance.getUser().getLogin()).md5
                LibraryAPI.sharedInstance.addStoreComment(plugin.getId(), author: authorField.text!, rate: selectedRate, comment: commentField.text, keyLoginHash: keyUser) { (result) -> () in
                    //add a nslocalise
                    print(result, terminator: "")
                }
            }

            sendingComment.startAnimating()
            sendingComment.hidden = false
            sleep(1)
        }
    }
}
