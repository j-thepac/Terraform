# to run shell script / py 


resource "null_resource" "null_shell" {
  triggers = {
    id = timestamp()
  }

  provisioner "local-exec" {
    command = "echo hi"  # shell

  }
}

resource "null_resource" "null_py" {
  triggers = {
    val = timestamp()
  }

  provisioner "local-exec" {
    command = "python3 script.py ${self.triggers.val}"  # shell

  }
}
