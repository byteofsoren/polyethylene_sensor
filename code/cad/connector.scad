/* Globals */
pad_width=1.09;
pad_heigt=3.08;
pad_spacing=5.04;


/* bends(70,0.8,3); */

pin();

translate([-15,0,0])
%cube([50,10,5]);

/* Cable */
translate([18.88/2,8.14/2,3])
{
    cable(16);
}
/* Footprint */
footprint(8);
/* The pcb */
/* pcb(); */




/* Modules in the project */
module pin()
{
    /* create a cylider alonge the pad that is 28 avg = diametr of 0.3211mm */
    avgr = 0.3211/2;
    bend_angle=66;
    bend_rotation=42;
    /* Cable dummy */
    translate([pad_width + 0.8,pad_spacing-0.95,2.8])
    {
        cylinder(h=0.5,r1=0.89/2,r2=0.89/2, $fn=10);
        rotate([-180,0,-bend_rotation])
        bends(bend_angle,0.8,0.5);
    }
    /* On pand cable */
    translate([pad_width/2,0.4,0])
    {
        rotate([-90,0,0])
        {
            cylinder(h=pad_heigt-0.8,r1=avgr,r2=avgr);
        }
        cylinder(h=10,r1=avgr,r2=avgr);
    }
    /* Rise from pad to corn */
    translate([pad_width/2,pad_heigt - 0.5,0])
    {
        cylinder(h=0.5,r1=avgr,r2=avgr);
    }
    /* Trat */
    translate([pad_width/2,pad_heigt - 0.5,0.5])
    {
        cylinder(h=0.5,r1=avgr,r2=0.89/2,$fn=10);
        rotate([0,0,-bend_rotation])
            translate([0,0,0.5])
                bends(bend_angle, 0.8, 0.5);
    }

}

module bends(angle, radius, endpipe_length)
{
    /* The bend it self */
    rotate([90,0,-90])
    {
        translate([-radius,0,0])
        {
            rotate_extrude(angle=angle, convexity=30, $fn=100)
                translate([radius, 0, 0])
                circle(r = 0.89/2,$fn=10);
        }
    }
    /* Add the endpipe_length to the bend. */
    /* rotate([-angle,0,0]) */
    /*     translate([0, -cos(angle)*radius,sin(angle)*radius]) */
    translate([0,radius*cos(angle),radius*sin(angle)])
        rotate([-angle,0,0])
            rotate([0,0,20])
            cylinder(h=endpipe_length,r=0.89/2,$fn=10);
}


module cable(n)
{
    /* separation = 1.27; */
    /* stepping = [ for (i = [0 : separation : separation*(n- 1)]) i ]; */
    /* echo(separation) */
    translate([-(n-1)/2-0.3,0,0])
    color("SlateGray",0.8)
    {
        for(i = [0:n-1])
        {
            translate([i + 0.27,0,0])
            {
                cylinder(h=10,r1=0.89/2,r2=0.89/2, $fn=10);
            }
        }
    }
}


module pcb()
{
    width = 91.19;
    height = 78.74;
    /* PCB*/
    translate([-43.90,19.33,0])
    {
        translate([0,-height,-0.8])
            cube([width,height,0.8]);
    }
}

module footprint(rows)
{
    stepping = [ for (i = [0 : 2.54 : 2.54*(rows - 1)]) i ];
    echo(stepping);
    color("Silver",1.0)
    {
        for(i = [0:rows])
        {
            translate([stepping[i],0,0])
            {
                cube([1.10,3.10,0.01]);
                translate([0,5.4,0])
                {
                    cube([1.10,3.10,0.01]);
                }
            }
        }
    }
}
