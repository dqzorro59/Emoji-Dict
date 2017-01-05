//
//  ViewController.swift
//  Emoji Dict
//
//  Created by Dennis Quinones2 on 1/2/17.
//  Copyright © 2017 Dennis Quinones. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var emojiTableView: UITableView!
    

    var emojiList : [CEmoji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        emojiTableView.dataSource = self
        emojiTableView.delegate = self
        emojiList = createEmojiList()
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return emojiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let emoji = emojiList[indexPath.row]
        
        cell.textLabel?.text = emoji.symbol
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       tableView.deselectRow(at: indexPath, animated: true)
       let emoji = emojiList[indexPath.row]
        
       performSegue(withIdentifier: "moveSegue", sender: emoji)
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let defVC = segue.destination as! DefinitionViewController
        defVC.emoji = sender as! CEmoji
        
    }
    
    func createEmojiList() -> [CEmoji] {
        
        let emoji1 = CEmoji()
        emoji1.symbol = "😎"
        emoji1.definition = "Movie Star"
        emoji1.category = "Faces"
        emoji1.birthYear = 2009
        
        let emoji2 = CEmoji()
        emoji2.symbol = "💩"
        emoji2.definition = "Poo Face"
        emoji2.category = "Faces"
        emoji2.birthYear = 2015
        
        let emoji3 = CEmoji()
        emoji3.symbol = "🤑"
        emoji3.definition = "Silly Face"
        emoji3.category = "Faces"
        emoji3.birthYear = 2011
        
        let emoji4 = CEmoji()
        emoji4.symbol = "😈"
        emoji4.definition = "Evil Face with Horns"
        emoji4.category = "Faces"
        emoji4.birthYear = 2014
        
        let emoji5 = CEmoji()
        emoji5.symbol = "🐹"
        emoji5.definition = "Cute Hamster"
        emoji5.category = "Animal"
        emoji5.birthYear = 2015
        
        return [emoji1, emoji2, emoji3, emoji4, emoji5 ]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

