var __b__;
__b__ = action_if(active==0);
if __b__
{
active=1;
nodes=steps;
nr[nodes]=radius;

for(n=0; n<nodes; n+=1)
    {
    ngsp[n]=0;
    dir=n*360/nodes;
    ng[n]=radius;
    if(nodesChanged==0)
        nr[n]=radius;
    node[n]=instance_create(x+lengthdir_x(radius,dir),y+lengthdir_y(radius,dir),line);
    node[n].x2=x+lengthdir_x(radius,dir+360/nodes);
    node[n].y2=y+lengthdir_y(radius,dir+360/nodes);
    }


}

if(antiOut)
{
dir=point_direction(x,y,sonic.x,sonic.y);
a=round(dir*nodes/360);
if (point_distance(x,y,sonic.x,sonic.y)>nr[a])
    {sonic.x=x+lengthdir_x(nr[a]-16,dir);
    sonic.y=y+lengthdir_y(nr[a]-16,dir);}
}
 
if(goalOn)
{

for(n=0; n<nodes; n+=1)
    {
    if(nr[n]!=ng[n])
        {
        if(abs(nr[n]-ng[n])<1)
            {nr[n]=ng[n];
            ngsp[n]=0;}
        else if (abs(ngsp[n])>abs(ng[n]-nr[n])/8)
            nr[n]=approach(nr[n],8,ng[n],1);
        else
            {if(ng[n]>nr[n])
                ngsp[n]+=global.time;
            else
                ngsp[n]-=global.time;
            nr[n]+=ngsp[n];}
            
        nodesChanged=1;
        }
    }
}

if(nodesChanged)
    {
    nr[nodes]=nr[0];
    for(n=0; n<nodes; n+=1)
        {
        dir=n*360/nodes;
        node[n].x=x+lengthdir_x(nr[n],dir);
        node[n].y=y+lengthdir_y(nr[n],dir);
        node[n].x2=x+lengthdir_x(nr[n+1],dir+360/nodes);
        node[n].y2=y+lengthdir_y(nr[n+1],dir+360/nodes);
        with node[n]
            event_perform(ev_alarm,0);
        if (mogen==1)
            {
            if (node[n].x>x+radius-1 && node[n].y>=y+radius-128 && node[n].y2>=y+radius-128)
                node[n].on=0;
            }
        if (mogen==2)
            {
            if (node[n].y2>y+radius-1 && node[n].x>=x+radius-128 && node[n].x2>=x+radius-128)
                node[n].on=0;
            }
        }
    nodesChanged=0;
    }

image_index-=(1-global.time)*image_speed;
image_blend=make_color_hsv(tutorialgenerator.hue,255,255);
