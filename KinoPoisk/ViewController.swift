//
//  ViewController.swift
//  KinoPoisk
//
//  Created by Admin on 3.10.22.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet private weak var colectionView: UICollectionView!
    
    
    var film: Film?
    var posterArray: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session()
        self.colectionView.register(UINib(nibName: "FilmsCell", bundle: nil), forCellWithReuseIdentifier: "FilmsCell")
        self.colectionView.dataSource = self
        self.colectionView.delegate = self
    }
    
    
    let url = URL(string: "https://api.kinopoisk.dev/movie?field=rating.kp&search=7-10&token=1HGAM56-CFZM33W-HR9ECJK-REH9X31")!
    
    func session() {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {return}
            
            DispatchQueue.main.async  { [self] in
                do {
                    let date = try JSONDecoder().decode(Film.self, from: data)
                    
                    self.film = date
                    guard self.film != nil else { return }
                    
                    film?.docs.forEach({ i in
                        posterArray.append(i.poster.url)
                    })
                    
                    print(posterArray)
                    print(film?.docs[1].name ?? "server error")
                    colectionView.reloadData()
                }catch {
                    print(error)
                }
            }
        }.resume()
        
    }
    
}

extension ViewController:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.film?.docs.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmsCell", for: indexPath) as! FilmsCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
    }
    
    
}



