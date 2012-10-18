
module motor() {
difference() {
    union() {
        translate( [0,0,3] ) cube( size=[42.5,42.5,6], center=true);
        for( x = [ -1, 1 ] ) {
            translate( [x*31.25,18.25,-14] ) cube( size=[20,6,40], center=true );
            translate( [x* 24.25 ,10,-4] )
                rotate( [0,-90,0] ) linear_extrude(height = 6, center=true ) 
                    polygon( points=[ [-10,6], [10,6], [10,-20], [4,-20] ] );
        }
    }
    for( x = [ -15.5, 15.5 ] ) {
        for( y = [ -15.5, 15.5 ] ) {
            translate( [x,y,-1] ) cylinder( r = 1.5, h = 8, $fn=8 );
        }
    }
    for( x = [ -31.25, 31.25 ] )  {
        translate( [x,22,-24] ) 
              rotate( [90,0,0] ) cylinder( r = 2, h = 8, $fn = 12 );
    }

    translate( [0,0,-1] ) cylinder( r = 11.05, h = 8, $fn=24 );
}
}

module rod() {
    difference() {
        union() {
            cylinder( r = 8, h = 20, $fn = 32 );
            translate( [-8, 0,0] ) cube( size=[ 16, 9, 20 ] );
            translate( [0,-5.75, 10 ] ) cube( size = [ 48, 6, 20 ], center = true );
            for( x = [ -1, 1 ] )  {
                translate( [x*31.25,1, 3 ] ) cube( size = [ 20, 20, 6 ], center = true );
                translate( [x*31.25,11, 13 ] ) cube( size = [ 20, 4, 14 ], center = true );
                translate( [x*31.25,6, 19 ] ) cube( size = [ 20, 10, 2 ], center = true );
            }
        }
        translate( [0, 0,-1] ) cylinder( r = 4, h = 22, $fn = 16 );
        for( x = [ -1, 1 ] ) 
             translate( [x*31.25,1, -1 ] ) cylinder( r = 2, h = 6, $fn = 12 );

        translate( [0,10,15] )  
              rotate( [90,0,0] )  { 
                  cylinder( r = 1.5, h = 8, $fn = 8 );
                  translate( [0,0,3] ) cylinder( r = 3.25, h = 5, $fn = 6 );
        }
    }
}

translate( [0,0,20] )
rotate( [0,180,0] ) {
translate( [0, -21.25,14] ) motor();
translate( [0, 30-21.25,0] ) rod();
}

