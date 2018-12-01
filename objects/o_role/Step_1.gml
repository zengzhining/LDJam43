/// Previous frame checks

// Check if we're on the ground
onGround = place_meeting(x,y+1,o_block);

// Idle state always if anything changes
state = IDLE;
