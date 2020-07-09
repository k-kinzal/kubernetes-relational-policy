package kubernetes

resources[resource] {
   input["-"]
   resource = input["-"][_]
}
resources[resource] {
   not input["-"]
   not input["kind"]
   resource := input[_]
}
resources[resource] {
   not input["-"]
   input["kind"]
   resource = input
}
