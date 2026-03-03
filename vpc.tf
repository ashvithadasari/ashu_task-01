module "vpc01" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/vpc_module"
    vpcip = var.ipaddress
    vpcname = var.vpcname1
  
}

module "subnet01" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/subnet"
    subip = var.subipaddress
    avilzone = var.zones
    subname = var.subname1
    vpcid = module.vpc01.vpcop
    

}

module "subnet02" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/subnet"
    subip = "10.0.23.0/24"
    avilzone = "ap-south-1a"
    subname = "subnet-02"
    vpcid = module.vpc01.vpcop
}


module "igw01" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/igw"
    IGW = var.igwname
    vpcid = module.vpc01.vpcop
}

module "rt01" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/DRT"
    default_rt_id = module.vpc01.defaultrtop
    
    igw = module.igw01.IGWOP
    rtname = var.drtname
    
}

module "sg01" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/DSG"
    sgname = var.sgname1
    vpcid = module.vpc01.vpcop

   
}

module "s3bucket" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/s3_bucket"
    bucketnamee = var.bucketnamee1
}


module "instance1" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/ec2"
    ami0 = var.ami1
    instancetype = var.type1
    keyname = var.key1
    sub = module.subnet01.suboutput
    
    ec2name = var.ec21name

} 

module "instance2" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/ec2"
    ami0 = var.ami2
    instancetype = var.type2
    keyname = var.key
    sub = module.subnet01.suboutput

    ec2name = var.ec22name

} 

module "tgmod" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/tg"
    tgname = var.targetname
    instances = var.i
    vpcidd = module.vpc01.vpcop
    path = var.pa
    protocal = var.pro

}

module "tgaa" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/tg.attach"
    tgarn = module.tgmod.tgop
    instanceid = module.instance1.ec2op
}

module "tgmod1" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/tg"
    tgname = var.targetname1
    instances = var.i
    vpcidd = module.vpc01.vpcop
    path = var.pat
    protocal = var.prot

}

module "tgaa1" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/tg.attach"
    tgarn = module.tgmod1.tgop
    instanceid = module.instance2.ec2op
}

module "applb1" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/applb"
    lbname = var.appname
    value = var.appvalue
    type = var.apptype
    sggroup = [module.sg01.sgop]
    subnets = [module.subnet01.suboutput,module.subnet02.suboutput]
}

module "applblistener" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/applbls"
    lbarn = module.applb1.applbop
    pro = var.protocal
    tg = module.tgmod.tgop
}

module "rulemod" {
    source = "C:/Users/Ashu dasari/OneDrive/Documents/Desktop/module concept/module.terraform/lisn.rule"
    listarn = module.applblistener.lblop
    pri = var.vall
    patterns = [ "/parsonal/",
                "/parsonal",
                "/parsonal/*" ]
    tgarn1 = module.tgmod1.tgop
}
