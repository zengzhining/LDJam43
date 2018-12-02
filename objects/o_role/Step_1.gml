/// Previous frame checks

// Check if we're on the ground
onGround = place_meeting(x,y+1,o_block) or place_meeting( x, y+1, o_spine );
if( !onGround )
{
	if( place_meeting( x, y+1, o_meat ) )	
	{
		var meat = instance_place( x, y+1, o_meat );
		if( meat.bbox_top >= bbox_bottom )
		{
			onGround = true;	
		}
	}
}

// Idle state always if anything changes
//state = IDLE;
