struct Message {
    var receiver: Int
    var sender: Int
    var txt: String
    var senderName: String { //property name by id
        return Data.users[sender]!
    }
}
