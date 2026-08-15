function robot_turn_arms() {
	ms1=ms1 mod 360;
	ms2=ms2 mod 360;

	while(gms1>ms1+180)
	    gms1-=360;
	while(gms1<ms1-180)
	    gms1+=360;
    
	while(gms2>ms2+180)
	    gms2-=360;
	while(gms2<ms2-180)
	    gms2+=360;
    
	if (ms1<gms1)
	    {ms1+=rotsp*global.time;}
    
	if (ms1>gms1)
	    {ms1-=rotsp*global.time;}
    
	if (ms2<gms2)
	    {ms2+=rotsp*global.time;}

	if (ms2>gms2)
	    {ms2-=rotsp*global.time;}

	ps1=ps1 mod 360;
	ps2=ps2 mod 360;

	while(gps1>ps1+180)
	    gps1-=360;
	while(gps1<ps1-180)
	    gps1+=360;
    
	while(gps2>ps2+180)
	    gps2-=360;
	while(gps2<ps2-180)
	    gps2+=360;
    
	if (ps1<gps1)
	    {ps1+=rotsp*global.time;}
    
	if (ps1>gps1)
	    {ps1-=rotsp*global.time;}
    
	if (ps2<gps2)
	    {ps2+=rotsp*global.time;}

	if (ps2>gps2)
	    {ps2-=rotsp*global.time;}



	mh1=mh1 mod 360;
	mh2=mh2 mod 360;

	while(gmh1>mh1+180)
	    gmh1-=360;
	while(gmh1<mh1-180)
	    gmh1+=360;
    
	while(gmh2>mh2+180)
	    gmh2-=360;
	while(gmh2<mh2-180)
	    gmh2+=360;
    
	if (mh1<gmh1)
	    {mh1+=0.75*rotsp*global.time;}
    
	if (mh1>gmh1)
	    {mh1-=0.75*rotsp*global.time;}
    
	if (mh2<gmh2)
	    {mh2+=0.75*rotsp*global.time;}

	if (mh2>gmh2)
	    {mh2-=0.75*rotsp*global.time;}

	ph1=ph1 mod 360;
	ph2=ph2 mod 360;

	while(gph1>ph1+180)
	    gph1-=360;
	while(gph1<ph1-180)
	    gph1+=360;
    
	while(gph2>ph2+180)
	    gph2-=360;
	while(gph2<ph2-180)
	    gph2+=360;
    
	if (ph1<gph1)
	    {ph1+=0.75*rotsp*global.time;}
    
	if (ph1>gph1)
	    {ph1-=0.75*rotsp*global.time;}
    
	if (ph2<gph2)
	    {ph2+=0.75*rotsp*global.time;}
    
	if (ph2>gph2)
	    {ph2-=0.75*rotsp*global.time;}



}
