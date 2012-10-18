
for( i = [-1,1] )
translate( [ 0,-i * 18.5,0 ] )
rotate( [0,0,i*60] ) {
    difference() { 
        translate( [ 0,0,3 ] ) cube( size = [20,40,6], center=true );
        translate( [ 0,10,-1 ] ) cylinder( r = 2, h = 8, $fn = 16 );
        translate( [ 0,-10,-1 ] ) cylinder( r = 2, h = 8, $fn = 16 );
    }
}
translate( [ -17.33,0,3 ] ) cube( size = [10,34.32,6], center=true );

difference() {
union() {
translate( [ 14.35,0,9 ] ) cube( size = [16,39.6,18], center=true );
translate( [ 6.35,0,17.25 ] ) rotate( [0,90,0] ) cylinder( r = 8, h = 16, $fn = 32 );
}
translate( [ 18,0,-1 ] ) cylinder( r = 1.5, h = 19, $fn = 8 );
translate( [ 18,0,11 ] ) cylinder( r = 3.25, h = 4, $fn = 6 );
translate( [ 1,0,17.25 ] ) rotate( [0,90,0] ) cylinder( r = 4, h = 22, $fn = 16 );
for( i = [-1,1] )
translate( [ 0,-i * 18.5,0 ] ) rotate( [0,0,i*60] ) translate( [ 0,0,13 ] ) cube( size = [20,40,20], center=true );
}