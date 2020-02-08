//
//  StorageController.swift
//  CommentCardWriter
//
//  Created by Zack Obied on 08/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

var commentCardComments: [[String]] = []
var commentCardSubjects: [[String]] = []

class StorageController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Storage"
        let refreshButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(refresh))
        self.navigationItem.rightBarButtonItem = refreshButton
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentCardSubjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCard", for: indexPath)
        let selectedCard = commentCardSubjects[indexPath.row]
        cell.textLabel?.text = "\(selectedCard[0]), \(selectedCard[1]), \(selectedCard[2]), \(selectedCard[3])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "StoredCommentCardViewController") as? StoredCommentCardViewController else {
            fatalError("Failed to load Stored Comment Card View Controller from Storyboard")
        }
        for i in 0..<vc.commentArray.count {
            vc.commentArray[i] = commentCardComments[indexPath.row][i]
        }
        for i in 0..<vc.subjectArray.count {
            vc.subjectArray[i] = commentCardSubjects[indexPath.row][i]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func refresh() {
        tableView.reloadData()
    }

}
