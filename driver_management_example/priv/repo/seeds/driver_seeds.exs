alias DriverManagementExample.Repo
alias DriverManagementExample.Management.Driver

Repo.insert! %Driver{ 
    name: "bela",
    email: "bela@bela",
    phone_num: "+3630",
    plate: "asd-123"
}

Repo.insert! %Driver{ 
    name: "feri",
    email: "feri@feri",
    phone_num: "+3670",
    plate: "123-sad"
}

Repo.insert! %Driver{ 
    name: "cili",
    email: "cili@cili",
    phone_num: "+3631",
    plate: "awd-245"
}