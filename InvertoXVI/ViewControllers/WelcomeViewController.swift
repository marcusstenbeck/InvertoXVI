//
//  WelcomeViewController.
//  InvertoXVI
//
//  Created by Marcus Stenbeck on 17/09/16.
//  Copyright © 2016 Marcus Stenbeck. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
  
  @IBAction func returnFromSegueActions(sender: UIStoryboardSegue) {
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    print("prepforsegue main")
  }

}
