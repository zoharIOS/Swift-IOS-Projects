import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var movies: [String: [String]] = [:]
    var titles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "movies", ofType: "plist")!
        movies = NSDictionary(contentsOfFile: path) as! Dictionary
        titles = Array(movies.keys)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableCell
        let title = titles[indexPath.row] //get title
        
        cell.ttl.text = title //set label for movie title
        cell.desc.text = movies[title]![0] //set text for textView
        
        //set img
        let url = URL(string: movies[title]![1])! //url to img
        URLSession.shared.dataTask(with: url) { (imgData, r, e) in
            let img = UIImage(data: imgData!) //in background
            
            DispatchQueue.main.async {
                cell.imgV.image = img
            }
        }.resume()
        
        return cell
    }
}
















