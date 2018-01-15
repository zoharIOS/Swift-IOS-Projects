import Foundation

//Serialize
let object: [String: Any] = ["grade 1": 10,"grade 2": 20,"grade 3": 30,"grade 4": 40] //some object
let jsonData = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)// serialize to Data
let jsonStr = String(data: jsonData, encoding: .utf8)!
print(jsonStr)

let json = """
[
    {
        "first": "Bubu",
        "last": "Bubu is the king",
        "gender": "male"
    },
    {
        "first": "Groot",
        "last": "I am Groot",
        "gender": "other"
    },
    {
        "first": "Deadpool",
        "last": "Chimichangas",
        "gender": "male"
    }
]
"""

//convert to swift object
let jObject = try JSONSerialization.jsonObject(with: json.data(using: .utf8)!, options: .mutableContainers) as! [[String: Any]]

//work with object from json
for item in jObject {
    print("first name: \(item["first"]!)")
}









