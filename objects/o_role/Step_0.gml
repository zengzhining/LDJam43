//input
checkInput();

if( state == IDLE )
{
	if( !onGround )	
	{
		state = JUMP;
	}
	else 
	{
		if (kJump)      // If jump and touching ground..
		{
		    v = -jumpHeight;        // ..give jump momentum to player..
		    state = JUMP;           // ..and show jump animation
			if( global.isPlayJumpSound == false )
			{
				audio_play_sound( s_jump, 10, false );
				global.isPlayJumpSound = true;
			}
		}
		else 
		{
			if (kJumpRelease)       // If stop pressing jump key..
		    {
		        if (v < 0) 
		            v *= 0.25;      // ..rapidly slow down our jump momentum and let gravity do its job!
		    }	
		}
	}
}
else if ( state == JUMP )
{
	if v < maxFallSpeed
	{
	    v += gravityForce;      // Make player fall (but with a maxFallSpeed limit!)
	}
	
	if( !kJump and kJumpRelease )
	{
		 if (v < 0) 
		    v *= 0.25;  
	}
	if( onGround )
	{
		state = IDLE;
	}
	else 
	{
		if( v > 0 )	
			state = FALL;
	}
	
}
else if ( state == FALL )
{
	if v < maxFallSpeed
	{
	    v += gravityForce;      // Make player fall (but with a maxFallSpeed limit!)
	}
	
	if( !kJump and kJumpRelease )
	{
		 if (v < 0) 
		    v *= 0.25;  
	}
	if( onGround )
	{
		state = IDLE;
	}
}
else if ( state == RUN )
{
	if( !onGround )	
	{
		state = JUMP;
	}	
	else 
	{
		// No moving inputs
		if (!kRight and !kLeft)
		    state = IDLE;                   // Stop when not moving inputs
		
		if (kJump)      // If jump and touching ground..
		{
		    v = -jumpHeight;        // ..give jump momentum to player..
		    state = JUMP;           // ..and show jump animation
			if( global.isPlayJumpSound == false )
			{
				audio_play_sound( s_jump, 10, false );
				global.isPlayJumpSound = true;
			}
		}	
		else 
		{
			if (kJumpRelease)       // If stop pressing jump key..
		    {
		        if (v < 0) 
		            v *= 0.25;      // ..rapidly slow down our jump momentum and let gravity do its job!
		    }
		}
	}
}

//if (!onGround) {
//	state = JUMP;
//	if v < maxFallSpeed
//	{
//	    v += gravityForce;      // Make player fall (but with a maxFallSpeed limit!)
//	}
//}


// Left input
if (kLeft and !kRight)
{
    facing = LEFT;              // Face player to the left
    h = -maxH;                  // Apply right speed
        
    if (onGround)               // If touch ground, show Run animation
        state = RUN;
}

// Right input
if (kRight and !kLeft)
{
    facing = RIGHT;             //Face player to the right
    h = maxH;                   // Apply right speed
    if (onGround)               // If touch ground, show Run animation
        state = RUN;
}

// No moving inputs
if (!kRight and !kLeft)
    h = 0                   // Stop when not moving inputs
    
// Jump input
//if (kJump && onGround)      // If jump and touching ground..
//{
//    v = -jumpHeight;        // ..give jump momentum to player..
//    state = JUMP;           // ..and show jump animation
//} 
//else 
//{
//    if (kJumpRelease)       // If stop pressing jump key..
//    {
//        if (v < 0) 
//            v *= 0.25;      // ..rapidly slow down our jump momentum and let gravity do its job!
//    }
//}
