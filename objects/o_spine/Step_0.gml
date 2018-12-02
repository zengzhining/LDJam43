x += self.moveSpeed * self.moveDirX;
y += self.moveSpeed * self.moveDirY;

if(self.moveSpeed == 0 ) return;

var role = global.gameRole;
if( role and role.state == role.IDLE )
{

	if( place_meeting( x,y, o_role ) )	
	{
		var dir = 1;
		createPlatform( x , y );
		//liveLost();
		lives --;
		audio_play_sound( s_die, 10, false );
		if( lives <= 0 )
		{
			room_goto( 0 );
		}
		else 
		{
			role.x = role.originX;
			role.y = role.originY;
		}
		
		instance_destroy(self);
	}
}