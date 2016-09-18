//
//  Test2ViewController.swift
//  InvertoXVI
//
//  Created by Marcus Stenbeck on 17/09/16.
//  Copyright © 2016 Marcus Stenbeck. All rights reserved.
//

import UIKit

let foods = ["GameScene", "MyScene"]

class LevelSelectController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return foods.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel!.text = foods[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    performSegue(withIdentifier: "gotoGame", sender: foods[indexPath.row])
  }
  
  func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
    performSegue(withIdentifier: "gotoMenu", sender: self)
    return false
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? GameViewController {
      if let levelName = sender as? String {
        destination.levelName = levelName
      }
    }
  }

}
