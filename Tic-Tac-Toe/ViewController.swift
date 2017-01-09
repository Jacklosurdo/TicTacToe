//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by jlosurdo on 11/18/16.
//  Copyright © 2016 Jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var label1: GridLabel!
    @IBOutlet weak var label2: GridLabel!
    @IBOutlet weak var label3: GridLabel!
    @IBOutlet weak var label4: GridLabel!
    @IBOutlet weak var label5: GridLabel!
    @IBOutlet weak var label6: GridLabel!
    @IBOutlet weak var label7: GridLabel!
    @IBOutlet weak var label8: GridLabel!
    @IBOutlet weak var label9: GridLabel!

    var labelsArray: [GridLabel] = []
    var myGrid = GridLabel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray = [label1, label2,label3,label4,label5,label6,label7,label8,label9]
    }
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer)
    {
        print ("screen tapped")
        
        for label in labelsArray //iterate through labelsarray
        {
            if label.frame.contains(sender.location(in: gridView))
            {
                if label.canTap == true
                {
                    
                if myGrid.xTurn == true
                {
                    label.text = "🐴"
                }
                else
                {
                    label.text = "🐔"
                }
                myGrid.xTurn = !myGrid.xTurn
                label.canTap = false //you are correct!
                myGrid.count += 1
                print(myGrid.count)
                }
            }
        }
        checkWinner()
    }
   
    func checkWinner()
    {
        if label1.text == label2.text && label2.text == label3.text && label1.text != ""
        {
            print("Winner!")
            win(label1.text!)
        }
        if label4.text == label5.text && label5.text == label6.text && label4.text != ""
        {
            print("Winner!")
            win(label4.text!)
        }
        if label7.text == label8.text && label8.text == label9.text && label1.text != ""
        {
            print("Winner!")
            win(label7.text!)
        }
        if label1.text == label4.text && label4.text == label7.text && label1.text != ""
        {
            print("Winner!")
            win(label1.text!)
        }
        if label2.text == label5.text && label5.text == label8.text && label2.text != ""
        {
            print("Winner!")
            win(label2.text!)
        }
        if label3.text == label6.text && label6.text == label9.text && label3.text != ""
        {
            print("Winner!")
            win(label3.text!)
        }
        if label1.text == label5.text && label5.text == label9.text && label1.text != ""
        {
            print("Winner!")
            win(label1.text!)
        }
        if label3.text == label5.text && label5.text == label7.text && label3.text != ""
        {
            print("Winner!")
            win(label3.text!)
        }
        if myGrid.count == 9
        {
            win("No One")
        }
    }
    func win(_ winner:String)
    {
        // desplay alert controller
        let alert = UIAlertController(title: winner + "is the winner", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        let resetButton = UIAlertAction(title: "play again", style: .default, handler:
        {
            (sender) in
            for labels in self.labelsArray
            {
                labels.text = ""
                labels.canTap = true
            }
            self.myGrid.xTurn = true
            self.myGrid.count = 0
        })
        alert.addAction(resetButton)
        present(alert, animated: true, completion: nil)
    }


}

