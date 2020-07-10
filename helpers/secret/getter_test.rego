package kubernetes

test_get_secrets {
    secrets := get_secrets(input) with input as {"apiVersion":"v1","kind":"Secret","metadata":{"name":"mysecret"},"type":"Opaque","data":{"username":"YWRtaW4=","password":"MWYyZDFlMmU2N2Rm"}}
    secret := secrets[_]
    secret.kind == "Secret"
}