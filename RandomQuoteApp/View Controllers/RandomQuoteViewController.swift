//
//  ViewController.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 12/26/22.
//

import UIKit

class RandomQuoteViewController: UIViewController {

    @IBOutlet weak var QuoteLabel: UILabel!
    @IBOutlet weak var AuthorLabel: UILabel!
    
    @IBAction func getQuote(_ sender: UIButton) {
        fetchQuote()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        QuoteLabel.text = ""
        AuthorLabel.text = ""
        fetchQuote()
    }
    
    let apiURL = "https://dummyjson.com/quotes/random"
    func fetchQuote() {
        let url = URL(string: apiURL)!
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  let data = data,
                  error == nil,
                  let result = try? JSONDecoder().decode(Quote.self, from: data)
            else { return }
            
            DispatchQueue.main.async {
                self.QuoteLabel.text = "\"\(result.quote)\""
                self.AuthorLabel.text = "- \(result.author)"
            }
        }
        task.resume()
    }
}

