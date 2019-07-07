var modifier = 0;
if (keyboard_get_numlock()) {
    modifier |= $100;
} else modifier |= $000;

if (keyboard_check(vk_shift)) {
    modifier |= $002;
} else modifier |= $000;

if (keyboard_check(vk_control)) {
    modifier |= $004;
} else modifier |= $000;

if (keyboard_check(vk_alt)) {
    modifier |= $008;
} else modifier |= $000;

return modifier;


