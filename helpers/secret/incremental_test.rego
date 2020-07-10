package kubernetes

test_secret {
    secrets[secret] with input as {"apiVersion":"v1","kind":"Secret","metadata":{"name":"mysecret"},"type":"Opaque","data":{"username":"YWRtaW4=","password":"MWYyZDFlMmU2N2Rm"}}
    secret.kind == "Secret"
}
