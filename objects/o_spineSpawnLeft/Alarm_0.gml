
var spine = instance_create_layer( x,y, "Instances", o_spine );
spine.moveSpeed = self.spineMoveSpeed;
spine.moveDirX = self.spawnDirX;
spine.moveDirY = self.spawnDirY;

var moveDirX = spine.moveDirX;
var moveDirY = spine.moveDirY;

if( moveDirX == 0 and moveDirY == 0  ) spine.image_angle = 0;
if( moveDirX == -1 and moveDirY == 0 ) spine.image_angle = 90;
if( moveDirX == 1 and moveDirY == 0 ) spine.image_angle = 270;
if( moveDirX == 0 and moveDirY == 1 ) spine.image_angle = 180;
if( moveDirX == 0 and moveDirY == -1 ) spine.image_angle = 0;

show_debug_message("instance_create_layer");

alarm[0] = 5 * room_speed;