
width=2;
length=8;
pcb_size = [100,200,5];
color_pcb = "Green";
color_pin = "Gold";
color_esd = "DarkSlateGray";
eds_pad_hole = 100;


translate([20,20,-1])
spike_grid(3,8,20);
color(color_pcb,1.0)
    cube(pcb_size, false);

difference()
{
    translate([0,0.1,5.2])
        esd_pad(100,200,60,eds_pad_hole);
    color("DarkSlateGray",1.0)
        rotate([-40,0,0])
        cylinder(h=150,r=50);
}

module esd_pad(width,length,height,divider)
{
    xr = rands(0,width,width/divider);
    yr = rands(0,length,length/divider);
    zr = rands(0,height,height/divider);
    color("DarkSlateGray",1.0)
    difference()
    {
        cube([width,length,height]);
        for(xi = xr)
        {
            for(yi = yr)
            {
                for(zi = zr)
                {
                    r = rands(1.0,5,1);
                    translate([xi,yi,zi])
                        sphere(r=r[0],$fn = 8);
                }
            }
        }
    }

}

module spike_grid(x_count,y_count, spacing)
{
    for(xi = [0 : spacing : spacing*x_count])
    {
        for(yi = [0 : spacing : spacing*y_count])
        {
            translate([xi,yi,0])
                spike(2,40);
        }
    }
}



module spike(width,length)
{
    pin_scale = width*0.7;
    top_separator = 2;
    color(color_pin,1.0)
        cube([width,width,length/top_separator],false);
        translate([width/2,width/2,length/top_separator])
            rotate(45)
                {
                    color(color_pin,1.0)
                        cylinder(pin_scale,pin_scale,0.3, false, $fn=4);
                }
}
