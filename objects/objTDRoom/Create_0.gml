action_set_relative(1);
instance_create(x+24,y+256,objCpuTable);
instance_create(x+72,y+256,objCpuTable);

instance_create(x+54,y+256-32,objCpu);
instance_create(x+20,y+256-32,objCpu);
instance_create(x+80,y+256-32,objMouse);

instance_create(x+352-32,y+256-32,objRack);
instance_create(x+352-24,y+256,objCpuTable);
instance_create(x+352-72,y+256,objServer);
instance_create(x+352-112,y+256-32,objEquipRack);
instance_create(x+352-120,y+256,objCpuTable);
instance_create(x+352-168,y+256,objCpuTable);
instance_create(x+352-216,y+256,objServer);
b=32;
instance_create(x+b,y+256,objCables2);
instance_create(x+b,y+256,objCables1);
b+=32;
instance_create(x+b,y+256,objCables1);
instance_create(x+b,y+256,objCables2);
b+=32;
instance_create(x+b,y+256,objCables1);
instance_create(x+b,y+256,objSockets);
b+=32;
instance_create(x+b,y+256,objCables1);

b+=32;
instance_create(x+b,y+256,objCables1);
b+=32;
instance_create(x+b,y+256,objCables1);
instance_create(x+b,y+256,objSockets);
b+=32;
instance_create(x+b,y+256,objCables1);
instance_create(x+b,y+256,objSockets);
b+=32;
instance_create(x+b,y+256,objCables2);


instance_create(x+60,y+160,objring);
instance_create(x+80,y+160,objring);

instance_create(x+352-60,y+160,objring);
instance_create(x+352-80,y+160,objring);
action_create_object(objTDWalls, 0, 0);
action_set_relative(0);
