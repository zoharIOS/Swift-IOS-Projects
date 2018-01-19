import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    typealias Coin = [String: Any]

    var coins: [Coin] = []
    @IBOutlet var tbl: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        let url = URL(string: "https://api.coinmarketcap.com/v1/ticker/?limit=10")!
        URLSession.shared.dataTask(with: url, completionHandler: {(d,r,e) in
            AsyncTask(backgroundTask: { (d: Data) -> [Coin]? in
                return (try? JSONSerialization.jsonObject(with: d, options: .mutableContainers)) as? [Coin]
            }, afterTask: { coins in
                if coins == nil {print("nil was found HERE")}
                self.coins = coins ?? []
                self.tbl.reloadData()
            }).execute(d!)
        }).resume()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let index = indexPath.row
        cell.textLabel?.text = "\(coins[index]["name"]!) \(coins[index]["price_usd"]!)"
        return cell
    }
}








