locals{ 
        l =[0,1,2,3]
        l_map = {
                    for i in local.l :
                    i => i
                }
        d={"a"=1,"b"=2}
    }

output "op1"{
    value=[
        for i in local.l: 
        i==0 ? "zero":
        i%2==0 ? "${i} = even" :
        "${i} = odd"

    ]
}
output "op2"{
    value={
        for k,v in local.d: v=> k
    }
}
