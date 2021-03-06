//
//  AnalysisViewController.swift
//  SOSVietnam
//
//  Created by Ecko Huynh on 25/04/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class AnalysisViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var resolvedLabel: UILabel!
    @IBOutlet weak var remainedLabel: UILabel!
    
    var requests: [IssueInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteLabel.text = "\"Lá lành đùm lá rách\""
        APIClient.getAllIssues { [weak self] (response) in
            if let _ = response.error {
                return
            }
            self?.requests = response.value ?? []
            if let count = self?.requests.count {
                self?.totalLabel.text = "Tổng số yêu cầu: \(count)"
                self?.resolvedLabel.text = "Tổng số yêu cầu đã được giải quyết: 0"
                self?.remainedLabel.text = "Tổng số yêu cầu chưa được giải quyết: \(count)"
            }
        }
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
       
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let seconds = 2.0
//        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
//            self.root?.popViewController(animated: true)
//            let vc = HomeTabbarViewController(nibName: "HomeTabbarViewController", bundle: nil)
//
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
}
