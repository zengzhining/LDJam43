kLeft        = keyboard_check(vk_left)        or gamepad_axis_value(0, gp_axislh) < -0.40;
kRight       = keyboard_check(vk_right)       or gamepad_axis_value(0, gp_axislh) >  0.40;
kJump        = keyboard_check_pressed(vk_up)  or gamepad_button_check_pressed(0, gp_face1);
kJumpRelease = keyboard_check_released(vk_up) or gamepad_button_check_released(0, gp_face1);
