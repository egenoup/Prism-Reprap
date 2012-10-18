nut_width = 6.5;

difference() {
cylinder( r = 11, h = 10 + nut_width );
translate( [0,0,-1] ) cylinder( r = 2.5, h = 12, $fn = 12 );
translate( [0,0,10] ) cylinder( r = nut_width + 1, h = 7, $fn = 6 );
translate( [0,0,5] )
rotate( [90,0,0 ] ) {
   translate( [0,0,1] ) cylinder( r = 1.5, h = 12, $fn = 8 );
   translate( [0,0,4] ) cylinder( r = 3.15, h = 2.4, $fn = 6 );
}
translate( [-3.15,-2.4 - 4,-1] ) cube( size= [6.3, 2.4,6] );
}