
output "external_ip" {
  description = "The external IP address attached to the VM instance."
  value       = local.external_ip
}

output "sa_email" {
  description = "Email address of the ServiceAccount that is attached to the VM instance."
  value       = local.vm_sa_email
}

output "sa_roles" {
  description = "All roles (except sensitive roles filtered by the module) that are attached to the ServiceAccount generated for this VM."
  value = (
    local.create_new_sa == true
    ?
    module.service_account.0.roles
    :
    ["No new ServiceAccount was generated for this VM. See roles attached to the ServiceAccount '${local.vm_sa_email}' instead."]
  )
}

output "self_link" {
  description = "The URI of the created resource."
  value       = google_compute_instance.vm_instance.self_link
}

output "id" {
  description = "An identifier for the resource with format projects/{{project}}/zones/{{zone}}/instances/{{name}}"
  value       = google_compute_instance.vm_instance.id
}

output "instance_id" {
  description = "The server-assigned unique identifier of this instance. Example: 4567719474035761998"
  value       = google_compute_instance.vm_instance.instance_id
}

output "instance_name" {
  description = "The generated name of the GCloud VM Instance. Example: myubuntu2010-vm-tfa2c4"
  value       = local.instance_name
}

output "zone" {
  description = "The zone in which the VM instance was launched."
  value       = google_compute_instance.vm_instance.zone
}