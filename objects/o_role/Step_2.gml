/// Actual collision checks and properties updates

//Update state properties
image_xscale = facing; // Player sprite always looks on facing direction

// COLLISIONS AND POSITION UPDATE ------------------------- //
// Vertical
if( abs(v) > 0 )
{
	repeat(abs(v)) {
	    if (!place_meeting(x, y + sign(v), o_block) )
		{
			//col with spine, room restart
			if( place_meeting( x, y+ sign(v), o_spine ) )
			{
				var obj = instance_place(x, y+ sign(v), o_spine );
				if( 0 == obj.image_angle or 180 == obj.image_angle )
				{
					var dir = 1;
					if( 180 == obj.image_angle ) dir = -1;
					createPlatform( x, y - dir * heightCreatePlatform );
					//instance_create_layer(x,y - 32, "Instances", o_spine );
					liveLost();
					instance_destroy(obj);
					break;
				}
			}
			else if ( place_meeting( x, y+ sign(v), o_meat ) )
			{
				var meat = instance_place( x, y+ sign(v), o_meat );
				if ( state == FALL )
				{
					if( bbox_bottom + sign(v) <= meat.bbox_top )
					{
						v = 0;
						break;
					}
					y += sign(v);
					
				}
				else if( state == JUMP )
				{
					y += sign(v);
				}
				
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
}
// Horizontal
if( abs(h) > 0 )
{
	repeat(abs(h)) {  
	    if ( (!place_meeting(x + sign(h), y, o_block) 
		&& !place_meeting(x + sign(h), y, o_spine)
		) )
		{
			x += sign(h); //If player don't collide left or right, update x position
		}
	    else 
		{
			if( place_meeting( x + sign(h), y, o_spine ) ) 
			{
				var obj = instance_place( x + sign(h), y, o_spine )
				if(270 == obj.image_angle or 90 == obj.image_angle  )
				{
					var dir = 1;
					if( 90 == obj.image_angle ) dir = -1;
				
					createPlatform( x + dir * widthCreatePlatform , y + heightCreatePlatform );
					liveLost();
					instance_destroy(obj);
					break;
				}
			}
			//else if ( place_meeting( x + sign(h), y, o_meat ) )
			//{
			//	x += sign(h);
			//}
			else
			{
		        h = 0; // If he collides, can't go further...
		        break; // ..and we stop checking horizontal collisions this frame
			}
	    }
	}
}
else 
{
}
// -------------------------------------------------------- //

// ------ STATES MACHINE ---------------------------------- //
switch (state) {
    case IDLE: 
        image_speed = 0.15;
        sprite_index = s_role_idle;
		global.isPlayJumpSound = false;
    break;
    
    case RUN: 
        image_speed = 0.5; 
		sprite_index = s_role_run;
		global.isPlayJumpSound = false;
    break;
    
    case JUMP:
		
    break;
}

// ------ WIN AND LOOSE CONDITIONS ------------------------ //
// If player falls off the room, "dies" (we restart the room)
if (y > room_height + sprite_height/2)
{
    //room_restart();
	liveLost();
}
// -------------------------------------------------------- //

