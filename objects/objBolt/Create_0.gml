x2 = x;
y2 = y+480;
count = floor(random(13));
for(c=0; c<=2; c+=1)
    {
    color[c]=make_color_rgb(min(255,96*(1+c)),min(255,80*(1+c)),min(255,128*(1+c)));
    }


i=instance_create(x,y,objBranch);
i.p=id;
i.sp=id;
with i
    event_user(0);
timer = 0;
alpha = 1;
