This project demonstrates two important Terraform functions — element() and lookup() — used to automate AWS EC2 instance provisioning dynamically.
Each function shows how Terraform can use variables and maps/lists to create flexible, reusable infrastructure definitions 🚀.

⚙️ 1. element() Function — List-Based Instance Creation

🧩 Purpose:
The element() function is used to pick a specific value from a list based on its index. It helps in creating dynamic, reusable, and scalable Terraform configurations.

🧠 Syntax:

element(list, index)


list → The list you’re selecting from.

index → The position number (starts from 0).

If the index is greater than the list length, it wraps around automatically 🔄.

💻 In Your Code Example:
ami             = element(var.ami, count.index)
instance_type   = element(var.instance_type, count.index)


Here:

count.index gives the current iteration number (0, 1, 2, ...).

Terraform uses that index to:

Select the correct AMI ID from the ami list.

Select the matching instance type from the instance_type list.

🏢 At an Organization Level:
The element() function enables automated, consistent, and reusable infrastructure by dynamically selecting approved resources (like AMIs or instance types) across multiple environments — ensuring standardization and cost-efficient provisioning at scale ⚡.

------------------------------------------------------------------------------------------------------------------------------------
🧭 2. lookup() Function — Map-Based Configuration

🧩 Purpose:
The lookup() function in Terraform is used to retrieve a value from a map using a specific key.
It’s super helpful when you have multiple configurations (like regions, environments, or instance types) defined in a map, and you want to pick the right one dynamically.

🧠 Syntax:
lookup(map, key, [default])


map → A key-value set you’re searching in.

key → The key whose value you want to retrieve.

default (optional) → A fallback value if the key isn’t found.

💻 In Your Code Example:
instance_type = lookup(var.instance_type, var.location)


🧩 Here’s what happens:

var.location = "ap-south-1"

var.instance_type =

{
  us-east-1  = "t2.nano"
  ap-south-1 = "t2.nano"
}


Terraform looks up the key "ap-south-1" in the instance_type map, finds the value "t2.nano", and assigns it as the instance type.

✅ Result:
The EC2 instance is created in the specified location using the instance type mapped to that region.

📊 Example Output
Location (var.location)	Instance Type (from map)
us-east-1	t2.nano
ap-south-1	t2.nano

If you had included a default, like this:

lookup(var.instance_type, var.location, "t2.micro")


Terraform would use t2.micro if the region key wasn’t found 🛡️.

🏢 At an Organization Level:
The lookup() function enables standardized, environment-aware infrastructure by dynamically selecting approved configurations (like instance types or AMIs) per region or environment — ensuring consistency, compliance, and scalable deployments across the enterprise ⚡.
