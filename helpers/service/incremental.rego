package kubernetes

services[service] {
   resources[resource]
   resource.kind == "Service"
   service = resource
}
