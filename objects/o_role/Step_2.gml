/// Actual collision checks and properties updates

//Update state properties
image_xscale = facing * 3; // Player sprite always looks on facing direction

// COLLISIONS AND POSITION UPDATE ------------------------- //
// Vertical
repeat(abs(v)) {
    if (!place_meeting(x, y + sign(v), o_block))
	{
		//col with spine, room restart
		if( place_meeting( x, y+ sign(v), o_spine ) )
		{
			show_debug_message( "dead---" );
			
			lives --;
			createPlatform( x, y - heightCreatePlatform );
			//instance_create_layer(x,y - 32, "Instances", o_spine );
			if( lives <= 0 )
			{
				room_restart();
				return;
			}
			
			x = originX;
			y = originY;
			
			return;
		}
		else 
		{
			y += sign(v); //If player don't collide under or above, update y position
		}
	}
    else 
	{
		v = 0; // If he collides, can't go further...
		break; // ..and we stop checking vertical collisions this frame
    }
}
// Horizontal
repeat(abs(h)) {  
    if (!place_meeting(x + sign(h), y, o_block))
        x += sign(h); //If player don't collide left or right, update x position
    else {
        h = 0; // If he collides, can't go further...
        break; // ..and we stop checking horizontal collisions this frame
    }
}
// -------------------------------------------------------- //

// ------ STATES MACHINE ---------------------------------- //
switch (state) {
    case IDLE: 
        image_speed = 0.15;
        //sprite_index = sPlayerIdle;
    break;
    
    //case RUN: 
    //    image_speed = 0.5; 
    //    sprite_index = sPlayerRun;
    //break;
    
    //case JUMP:
    //    image_speed = 0.5; 
    //    // Jump and fall
    //    if (v <= 0) 
    //        sprite_index = sPlayerJump;  
    //    else
    //        sprite_index = sPlayerFall;
            
    //    if image_index >= image_number-1
    //        image_speed = 0;
    //break;
}

// ------ WIN AND LOOSE CONDITIONS ------------------------ //
// If player falls off the room, "dies" (we restart the room)
if (y > room_height + sprite_height/2)
{
    //room_restart();
	lives --;
}
// -------------------------------------------------------- //

