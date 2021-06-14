//
//  HLWebView.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/14/21.
//

import UIKit
import WebKit

class HLWebViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    var viewModel: TopStoryCellViewModel?

    static func viewController(vm: TopStoryCellViewModel) -> HLWebViewController {
        let sb = UIStoryboard(name: "Main", bundle: .main)
        let vc = sb.instantiateViewController(identifier: "HLWebViewController") as! HLWebViewController
        vc.viewModel = vm
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.title ?? ""
        guard let urlString = viewModel?.articleURLString else { return }
        load(url: urlString)
    }

    private func load(url: String) {
        guard let validUrl = URL(string: url) else {
            return
        }
        let request = URLRequest(url: validUrl)
        webview.allowsBackForwardNavigationGestures = true
        webview.load(request)
    }

}
