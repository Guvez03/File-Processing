//
//  ViewController.swift
//  File Işlemleri
//
//  Created by ahmet on 29.06.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var veriGirisi: UITextField!
    
    @IBOutlet weak var resim: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func VeriKaydet(_ sender: Any) {
        
        let gelenVeri = veriGirisi.text!
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            // döküman yolu alındı
            
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            // Kayıt edilmek istenen dosya ve dosya yolu oluşturulur
            
            do{
                try gelenVeri.write(to: dosyaYolu, atomically: false, encoding: String.Encoding.utf8)
                
                veriGirisi.text = " "
                
            }catch{
                print("Dosya kayıt edilirken hata")
            }
            
        }
        
        
        
    }
    
    @IBAction func VeriGetir(_ sender: Any) {
                       
               if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
                   // döküman yolu alındı
                   
                   let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
                   // Kayıt edilmek istenen dosya ve dosya yolu oluşturulur
                   
                   do{
                    veriGirisi.text = try  String(contentsOf: dosyaYolu, encoding: String.Encoding.utf8)
                       
                       
                   }catch{
                       print("Dosya getirilirken  hata")
                   }
                   
               }
               
        
    }
    @IBAction func veriSil(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            // döküman yolu alındı
            
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            // Kayıt edilmek istenen dosya ve dosya yolu oluşturulur
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path){
                // Silinmek istenen dosya var mı yok mu kontrolü yapılır
                do{
                    try FileManager.default.removeItem(at: dosyaYolu)
                    veriGirisi.text = ""
                               
                   }catch{
                       print("Dosya getirilirken  hata")
                   }
            }

        }
        
    }
    
    @IBAction func resimKaydet(_ sender: Any) {
        
       // let gelenVeri = resim.image!
               
               if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
                   // döküman yolu alındı
                   
                   let dosyaYolu = dir.appendingPathComponent("resimim.png")
                   // Kayıt edilmek istenen dosya ve dosya yolu oluşturulur
                   
                    let gelenResim = UIImage(named: "stevejobs")

                   do{

                    try gelenResim!.pngData()?.write(to: dosyaYolu)
                    
                   }catch{
                       print("Resim kayıt edilirken hata")
                   }
                   
               }
        
        
        
        
    }
    
    @IBAction func resimGetir(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            // döküman yolu alındı
            
            let dosyaYolu = dir.appendingPathComponent("resimim.png")
            // Kayıt edilmek istenen dosya ve dosya yolu oluşturulur
            
            self.resim.image = UIImage(contentsOfFile: dosyaYolu.path)
            
        }
             
        
        
    }
    
    @IBAction func resimSil(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
             // döküman yolu alındı
             
             let dosyaYolu = dir.appendingPathComponent("resimim.png")
             // Kayıt edilmek istenen dosya ve dosya yolu oluşturulur
             
              let gelenResim = UIImage(named: "stevejobs")

            
                 do{
                     try FileManager.default.removeItem(at: dosyaYolu)
                     resim.image = nil
                                
                    }catch{
                        print("Resim silerken  hata")
                    }
             
             
         }
        
    }
    
    
    
    
}

