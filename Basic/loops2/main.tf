locals {                                #Internal Variable
  l = [0, 1, 2]                         # list
  d = { for i in local.l : i => i * 2 } # dictionary	
}
output "op1" { #
  value = [
    for i in local.l : [
      for k, v in local.d :
      i == v ? "val exists ${i}" : null
    ]
  ]
}