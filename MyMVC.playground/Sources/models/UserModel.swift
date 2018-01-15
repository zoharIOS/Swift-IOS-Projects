class UserModel {
    //User HAS encapsulated id & name
    private var _id: Int!
    private var _name: String!
    
    //Accessible properties
    var id: Int {
        get {
            return _id
        }
        
        set(value) {
            _id = value
        }
    }
    
    var name: String {
        get {
            return _name
        }
        
        set {
            _name = newValue
        }
    }
}
