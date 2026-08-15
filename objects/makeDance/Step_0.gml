var __b__;
__b__ = action_if(false);
if __b__
{
j=0;while file_exists("dance"+string(j)+".bmp") j+=1;
screen_save("dance"+string(j)+".bmp");
}
