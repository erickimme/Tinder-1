//
//  CardsViewController.swift
//  Tinder
//
//  Created by Rahul Balla on 3/9/18.
//  Copyright © 2018 Rahul Balla. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardsInitialCenter: CGPoint!
    @IBOutlet weak var pictureImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pictureImage.image = #imageLiteral(resourceName: "ryan")
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        let tapGestureReecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(panGestureRecognizer)
        view.addGestureRecognizer(tapGestureReecognizer)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let location = sender.location(in: view)
        
        if(sender.state == .began){
            cardsInitialCenter = pictureImage.center
        }
        
        else if (sender.state == .changed){
            if(location.y < pictureImage.frame.height / 2){
                pictureImage.center = CGPoint(x: cardsInitialCenter.x + translation.x, y: cardsInitialCenter.y)
                pictureImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * Double.pi / 560))
            }
            else{
                pictureImage.center = CGPoint(x: cardsInitialCenter.x + translation.x, y: cardsInitialCenter.y)
                pictureImage.transform = CGAffineTransform(rotationAngle: CGFloat(-1 * Double(translation.x) * Double.pi / 560))
            }
            
            if(translation.x > 175 || translation.x < -175){
                UIView.animate(withDuration: 0.4, animations: {
                    self.pictureImage.alpha = 0
                })
            }
        }
        
        else if (sender.state == .ended){
            pictureImage.center = cardsInitialCenter
            pictureImage.transform = CGAffineTransform(rotationAngle: CGFloat(0.0))
        }
    }
    
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "ProfileViewController", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProfileViewController{
            if let image = pictureImage.image{
                destination.myImage = image
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
