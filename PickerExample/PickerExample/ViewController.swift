//
//  ViewController.swift
//  PickerExample
//
//  Created by Hyowon Choi on 2018. 4. 22..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView = UIImageView()
    var button = UIButton(type: .system)
    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 500)
        self.imageView.backgroundColor = .gray
        
        self.button.frame = CGRect(x: 0, y: 510, width: UIScreen.main.bounds.size.width, height: 50)
        self.button.setTitle("이미지 선택", for: .normal)
        self.button.titleLabel?.textAlignment = .center
        self.button.addTarget(self, action: #selector(self.pickImage), for: .touchUpInside)
        
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.button)
        
        self.picker.sourceType = .photoLibrary // 방식 선택. 앨범에서 가져오는걸로^^
        self.picker.allowsEditing = false // 수정가능하게 할지 선택. 하지만 false
        self.picker.delegate = self // picker delegate
    }
    
    @objc func pickImage() {
        self.present(self.picker, animated: true) // Controller기 때문에 present 메서드를 이용해서 컨트롤러 뷰를 띄워줍니다!
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage? = nil
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage { // 수정된 이미지가 있을 경우
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage { // 오리지널 이미지가 있을 경우
            newImage = possibleImage
        }
        
        imageView.image = newImage // 받아온 이미지를 이미지 뷰에 넣어줍니다.
        
        picker.dismiss(animated: true) // 그리고 picker를 닫아줍니다. ^^ 끝!
    }
    
}
