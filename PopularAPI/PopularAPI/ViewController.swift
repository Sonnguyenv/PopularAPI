
import UIKit

class ViewController: UIViewController {
    
    var eventsArray  = [Events]()

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "http://172.16.18.91/18175d1_mobile_100_fresher/public/api/v0/listPopularEvents") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let noname = try JSONDecoder().decode(Main.self, from: data)
                
                DispatchQueue.main.async {
                    self.eventsArray = (noname.response?.events)!
                    self.myTableView.reloadData()
                }
            } catch {}
        }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "PopularTableViewCell") as! PopularTableViewCell
        cell.nameLable.text = eventsArray[indexPath.row].name
        if let urlImage = URL(string: eventsArray[indexPath.row].photo ?? "") {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: urlImage)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgView.image = image
                    }
                }
            }
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let screen = storyboard.instantiateViewController(withIdentifier: "InfomationVC") as! InfomationVC
        screen.textRaw = eventsArray[indexPath.row].description_raw ?? ""
        screen.textHTML = eventsArray[indexPath.row].description_html ?? ""
        navigationController?.pushViewController(screen, animated: true)
    }
}
