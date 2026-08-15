fc=0;
nu=12;
for(a=0; a<nu; a+=1)    
    {
    px[a]=64*fc/(1+a);
    fc=!fc;
    }
lastVX=0;
tex=background_get_texture(bgWater);
tex2=background_get_texture(bgUnderWater);
