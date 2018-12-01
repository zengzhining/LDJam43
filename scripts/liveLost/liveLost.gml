
lives --;
audio_play_sound( s_die, 10, false );
if( lives <= 0 )
{
	room_goto( 0 );
}