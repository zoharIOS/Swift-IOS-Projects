var users=[];
users["bubu"] = "123";
users["groot"] = "321";

function tryLogin(uName, uPass) {
    var un = uName.value, up = uPass.value;
    ttl.textContent = (users[un] == up) ? "welcome" : "wrong";
}

function validate(input) {
    input.className = input.value ? "valid" : "invalid";
}
