//
//  CardsViewController.swift
//  Matchbox
//
//  Created by Dephanie Ho on 4/26/17.
//  Copyright © 2017 Dephanie Ho. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!

    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapProfile(_ sender: UIButton) {
        performSegue(withIdentifier: "profileSegue", sender: nil)

    }
    
    @IBAction func onDrag(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)

        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        profileImageView.isUserInteractionEnabled = true
        //profileImageView.addGestureRecognizer(panGestureRecognizer)
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = profileImageView.center
            UIView.animate(withDuration:0.4, delay: 0.0,
                           options: [],
                           animations: { () -> Void in
                            self.profileImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: nil)

            
        } else if sender.state == .changed {
            print("Gesture is changing")
            profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
            profileImageView.center = CGPoint(x: location.x, y: location.y)
            if(translation.x > 50)
            {
                self.profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
                //profileImageView.center  = velocity

            }
            else if(translation.x < 50)
            {
                self.profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-45 * M_PI / 180))
                //profileImageView.center = velocity
            }


        } else if sender.state == .ended {
            print("Gesture ended")
            self.profileImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            if(translation.x > 50)
            {
                UIView.animate(withDuration:0.4, delay: 0.0,
                               options: [],
                               animations: { () -> Void in
                                self.profileImageView.center = velocity
                }, completion: nil)
            }
            else if(translation.x < 50)
            {
                UIView.animate(withDuration:0.4, delay: 0.0,
                               options: [],
                               animations: { () -> Void in
                                self.profileImageView.center = velocity
                }, completion: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
