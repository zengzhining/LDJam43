
lives --;
audio_play_sound( s_die, 10, false );
instance_create_layer( x, y, "Instances", o_explosion );
if( lives <= 0 )
{
	room_goto( 0 );
}
else 
{
	x = originX;
	y = originY;
}

