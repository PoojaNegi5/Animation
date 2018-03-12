//
//  ViewController.swift
//  Animation
//
//  Created by Appinventiv on 09/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pinkView: UIView!
    
    @IBOutlet weak var smileyImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottom: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
     var optionArray = ["Curve Ease In","Curve Ease Out","Curve Ease InOut","Curve Linear","Curve Repeat","Curve Auto Reverse","Flip from Left","Change Smileys"]
    var animationOptionType = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        tableView.isHidden = true
        //for shadow
        tableView.layer.shadowOffset = CGSize(width : (tableView.frame.width+2),height : (tableView.frame.height+2))
        tableView.layer.shadowRadius = 5
        tableView.layer.shadowOpacity = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectButton(_ sender: UIButton) {
        if tableView.isHidden == true{
            tableView.isHidden = false
        }
        else{
            tableView.isHidden = true
        }
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        UIView.animate(withDuration: 2.0)
//        {
//            self.bottom.constant = 0.0
//            self.trailing.constant += self.leading.constant
//            self.leading.constant = 0.0
//            self.view.layoutIfNeeded()
//        }
//    }
    
    @IBAction func showButton(_ sender: UIButton) {
        print(animationOptionType)
        switch animationOptionType {
        case optionArray[0]:
            UIView.animate(withDuration: 6.0, delay: 0.0, options: .curveEaseIn, animations: {
                    self.bottom.constant = 0.0
                    self.trailing.constant += self.leading.constant
                    self.leading.constant = 0.0
                    self.view.layoutIfNeeded()
                }, completion: nil)
            print(optionArray[0])
            
       case optionArray[1]:
            UIView.animate(withDuration: 6.0, delay: 0.0, options: .curveEaseOut, animations: {
                self.bottom.constant = 0.0
                self.trailing.constant += self.leading.constant
                self.leading.constant = 0.0
                self.view.layoutIfNeeded()
                }, completion: nil)
            print(optionArray[1])
            
     case optionArray[2]:
            UIView.animate(withDuration: 5.0, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.bottom.constant = 0.0
                    self.trailing.constant += self.leading.constant
                    self.leading.constant = 0.0
                    self.view.layoutIfNeeded()
                }, completion: nil)
            print(optionArray[2])
            
     case optionArray[3]:
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: {
            self.bottom.constant = 0.0
            self.trailing.constant += self.leading.constant
            self.leading.constant = 0.0
            self.view.layoutIfNeeded()
        }, completion: nil)
             print(optionArray[3])
            
       case optionArray[4]:
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .repeat, animations: {
            self.bottom.constant = 0.0
            self.trailing.constant += self.leading.constant
            self.leading.constant = 0.0
            self.view.layoutIfNeeded()
        }, completion: nil)
             print(optionArray[4])

        case optionArray[5]:
            UIView.animate(withDuration: 0.8, delay: 0.0, options: .autoreverse, animations: {
                 self.bottom.constant = 0
                 self.trailing.constant = 240
                 self.leading.constant = 0
                self.view.layoutIfNeeded()
            }, completion: nil)
             print(optionArray[5])
        case optionArray[6]:
            UIView.transition(with: pinkView, duration: 2, options: .transitionFlipFromLeft, animations: {
                self.bottom.constant = 150
                self.leading.constant = 130
                self.trailing.constant = 130
                self.view.layoutIfNeeded()}, completion: nil)
            
        case optionArray[7]:
            UIView.transition(with: self.pinkView, duration: 1.5, options: .transitionFlipFromBottom, animations:{
                self.bottom.constant = 150
                self.leading.constant = 130
                self.trailing.constant = 130
                self.bottom.constant = 150
                self.smileyImage.image = UIImage(named : "smiley2")
                self.view.layoutIfNeeded()},completion:{(true) in
                        UIView.transition(with: self.pinkView, duration: 1.5, options: .transitionFlipFromTop, animations: {
                            self.bottom.constant = 0
                            self.trailing.constant = 220
                            self.leading.constant = 0
                            self.smileyImage.image = UIImage(named : "smiley3")
                            self.view.layoutIfNeeded()
                            }, completion: nil)})
        default:
            print("none Selected")
        }
   }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        self.bottom.constant = 240
        self.leading.constant = 240
        self.trailing.constant = 0
        self.smileyImage.image = UIImage(named:"smiley1")
        self.view.layoutIfNeeded()
        print("in stop")
    }
    
}


extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = optionArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       animationOptionType = optionArray[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

