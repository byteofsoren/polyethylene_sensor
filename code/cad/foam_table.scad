/*  _____ ___    _    __  __    ____    _    ____    */
/* |  ___/ _ \  / \  |  \/  |  / ___|  / \  |  _ \  */
/* | |_ | | | |/ _ \ | |\/| | | |     / _ \ | | | | */
/* |  _|| |_| / ___ \| |  | | | |___ / ___ \| |_| | */
/* |_|   \___/_/   \_\_|  |_|  \____/_/   \_\____/  */

h = 40;
w = 70;
d = 70;

table(w,d,h);

translate([15,15,h-13.01])
    pin_array(5,5,4);
translate([0,0,h])
color("DarkGreen",0.5)
cube([w,d,2]);


module table(width,depth, hegiht)
{
    difference()
    {
        color("DarkOrange",1.0)
            cube([width,depth,hegiht]);
        union()
        {
            color("DarkOrange",1.0)
            {
                translate([-width/4,depth/4,-0.01])
                    cube([width*1.6,depth*0.5,hegiht*0.6]);
                translate([width/4,-depth/4,-0.01])
                    cube([width*0.5,depth*1.6,hegiht*0.6]);
                translate([width/9,depth/9,-0.06])
                    cube([width*0.8,depth*0.8,hegiht*0.6]);
                translate([width/9,depth/9,-0.06])
                    cube([width*0.8,depth*0.8,hegiht*2]);
            }

        }
    }
}

module pin_array(xcount,ycount,skip)
{
    pin_width=2.54; //mm
    nr_of_pins_in_x = xcount;
    nr_of_pins_in_y = ycount;
    pin_jumps = skip;

    inc= pin_width * pin_jumps;
    for (xpin = [0:inc:inc*nr_of_pins_in_x-1])
    {
        for (ypin = [1:inc:inc*nr_of_pins_in_y-1])
        {
            pin(xpin,ypin);
            //echo(xpin,ypin);
        }
    }
}

module pin(x,y,z)
{
    pin_width=2.54; //mm
    height = 13;
    translate([x,y,z])
        translate([-pin_width/2,-pin_width/2,0])
        {
            cube([pin_width,pin_width,height]);
            color([0.8,0.8,0])
                translate([pin_width/2-0.64/2,pin_width/2-0.64/2,height])
                cube([0.64,0.64,5.84]);
        }
}
