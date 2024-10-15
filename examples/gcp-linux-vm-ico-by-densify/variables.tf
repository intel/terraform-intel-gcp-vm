variable "project" {
  type        = string
  description = "The ID of the project in which the resource resides."
}

#Name of the system.
variable "name" {
  default = "ico-test"
}
variable "densify_recommendations" {
  type = map(map(string))
  #sample map of map this would be generated by densify provided as a .auto.tfvars file that would have all the systems and info listed. 
  #In the file there would be multiple systems defined in this case it just has 1 called "ico-test". 
  #To see how it would work you can change the approvalType from all to na. As all assumes you have approved all changes and na would be used to say haven't approved the change and just want to make the system self-aware. 
  default = { 
    ico-test = {
      currentType = "n1-standard-2"
      recommendedType = "c4-standard-4"
      approvalType = "all"
      savingsEstimate = "26.6"
      predictedUptime = "94.32"
      reservedInstanceCoverage = "yes"
    }
  }
}

# Defaults this is used for fallback if the system name isn't found in the densify_recommendations. 
# This shouldn't be used in most cases likely use would be if you were to create a new system that hasn't been analyzed by Densify yet.
variable "densify_fallback"{
  type = map(string)
  default = {
	currentType = "n1-standard-2"
	recommendedType = "c4-standard-4"
  approvalType = "all"
	savingsEstimate = "0"
	predictedUptime = "0"
	reservedInstanceCoverage = "no"
  }
}
