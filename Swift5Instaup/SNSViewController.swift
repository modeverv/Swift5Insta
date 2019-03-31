//
//  SNSViewController.swift
//  Swift5Instaup
//
//  Created by seijiro on 2019/03/31.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit

class SNSViewController: UIViewController,UITextFieldDelegate {

  var endImage = UIImage()
  @IBOutlet var textView: UITextView!

  @IBOutlet var endImageView: UIImageView!

  override func viewDidLoad() {
        super.viewDidLoad()
    endImageView.image = endImage


        // Do any additional setup after loading the view.
    }
    

  @IBAction func post(_ sender: Any) {
    do {
      let activityViewController = UIActivityViewController(activityItems: [endImage,textView.text!], applicationActivities: nil)
      present(activityViewController, animated: true, completion: nil)
      
    } catch let error {
      print(error)
    }
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return true
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
