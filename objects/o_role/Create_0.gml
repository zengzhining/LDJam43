heightCreatePlatform = 16;
widthCreatePlatform = 16;
// Movement speed
h = 0;
v = 0;
// Max movement speed
maxH = 4.0;
// Jump and gravity variables
jumpHeight   = 10.0;
gravityForce = 0.80;
maxFallSpeed = 8.0;
// Check collisions below
onGround = false;

originX = x;
originY = y;

var kLeft,kRight,kJump,kJumpRelease;

// ----- PLAYER STATES INFO ---------------------------- //
// States
IDLE     = 10;
RUN      = 11;
JUMP     = 12;
DEAD     = 13;
FALL	 = 14;
// Facings
RIGHT =  1;
LEFT  = -1;
// Initialize player's properties
state  = IDLE;
facing = RIGHT;

global.gameRole = self;
