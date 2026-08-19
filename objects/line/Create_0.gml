xi=0;
xa=0;
yi=0;
ya=0;

// Legacy GameMaker treated instance IDs as sequential numbers and attempted
// to find the next segment using id + 1. IDs are references now, so initialise
// a safe default; level-generation code can still override x2/y2 afterwards.
x2 = x + 64;
y2 = y;

i1=-1;
i2=-1;
action_set_alarm(1, 0);
on = 0;
frict = 1;
loopGate = false;
