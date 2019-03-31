//
//  ViewController.swift
//  Swift5Instaup
//
//  Created by seijiro on 2019/03/31.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

  var saveImage = UIImage()

  override func viewDidLoad() {
    super.viewDidLoad()
    //Photos
    let photos = PHPhotoLibrary.authorizationStatus()
    if photos == .notDetermined {
      PHPhotoLibrary.requestAuthorization({status in
        if status == .authorized{



        } else {
        }
      })
    }

  }

  @IBAction func camera(_ sender: Any) {

    let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
    // カメラが利用可能かチェック
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
      // インスタンスの作成
      let cameraPicker = UIImagePickerController()
      cameraPicker.sourceType = sourceType
      cameraPicker.delegate = self
      self.present(cameraPicker, animated: true, completion: nil)

    }else{

      print("エラー")
    }

  }


  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {


    if (info[.originalImage] as? UIImage) != nil
    {

      saveImage = info[.originalImage] as! UIImage


      //閉じる処理
      picker.dismiss(animated: true, completion: nil)
      //画面遷移
      performSegue(withIdentifier: "next", sender: nil)




    }

  }

  // 撮影がキャンセルされた時に呼ばれる
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }


  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    if (segue.identifier == "next"){

      let subVC:FilterViewController = segue.destination as! FilterViewController
      subVC.passImage = saveImage

      

    }

  }
  
  @IBAction func album(_ sender: Any) {

    let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary

    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
      // インスタンスの作成
      let cameraPicker = UIImagePickerController()
      cameraPicker.sourceType = sourceType
      cameraPicker.delegate = self
      self.present(cameraPicker, animated: true, completion: nil)

    }
    else{
      print("エラー")

    }
  }

}

