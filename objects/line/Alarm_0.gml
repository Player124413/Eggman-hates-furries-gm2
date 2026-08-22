d = max(0.0001, point_distance(x,y,x2,y2));
ux=(x2-x)/d;
uy=(y2-y)/d;
p=point_direction(x,y,x2,y2);
nx=cos(degtorad(p+90));
ny=-sin(degtorad(p+90));

if (i1 != -1 && (!instance_exists(i1) || i1.object_index!=endpoint
    || !variable_instance_exists(i1,"p") || i1.p!=id)) i1=-1;
if (i2 != -1 && (!instance_exists(i2) || i2.object_index!=endpoint
    || !variable_instance_exists(i2,"p") || i2.p!=id)) i2=-1;
if(i1==-1)
    {i1=instance_create(x,y,endpoint);
    i1.p=id;
    i2=instance_create(x2,y2,endpoint);
    i2.p=id;
    on=1;}
else
    {
    with (i1)
        {
        x=other.x;
        y=other.y;
        hspeed=other.hspeed;
        vspeed=other.vspeed;
        }
    with (i2)
        {
        x=other.x2;
        y=other.y2;
        hspeed=other.hspeed;
        vspeed=other.vspeed;
        }
    }

if(x<x2){xi=x; xa=x2;}else{xa=x; xi=x2;}
if(y<y2){yi=y; ya=y2;}else{ya=y; yi=y2;}
