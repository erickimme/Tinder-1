//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Rahul Balla on 3/10/18.
//  Copyright © 2018 Rahul Balla. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    var myImage: UIImage!
    @IBOutlet weak var navbar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = myImage
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "CardsViewSegue", sender: self)
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
