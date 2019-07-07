var chromium_cursor = argument0;

switch(chromium_cursor) {
	case 0: // CT_POINTER
		return cr_default;
	case 1: // CT_CROSS
		return cr_cross;
	case 2: // CT_HAND
		return cr_handpoint;
	case 3: // CT_IBEAM
	case 30: // CT_VERTICALTEXT
		return cr_beam;
	case 4: // CT_WAIT
		return cr_hourglass;
	case 6: // CT_EASTRESIZE
	case 13: // CT_WESTRESIZE
	case 15: // CT_EASTWESTRESIZE
	case 18: // CT_COLUMNRESIZE
	case 21: // CT_EASTPANNING
	case 28: // CT_WESTPANNING
		return cr_size_we;
	case 7: // CT_NORTHRESIZE
	case 10: // CT_SOUTHRESIZE
	case 14: // CT_NORTHSOUTHRESIZE
	case 19: // CT_ROWRESIZE
	case 22: // CT_NORTHPANNING
	case 25: // CT_SOUTHPANNING
		return cr_size_ns;
	case 8: // CT_NORTHEASTRESIZE
	case 12: // CT_SOUTHWESTRESIZE
	case 16: // CT_NORTHEASTSOUTHWESTRESIZE
	case 24: // CT_NORTHWESTPANNING
	case 27: // CT_SOUTHWESTPANNING
		return cr_size_nesw;
	case 9: // CT_NORTHWESTRESIZE
	case 11: // CT_SOUTHEASTRESIZE
	case 17: // CT_NORTHWESTSOUTHEASTRESIZE
	case 23: // CT_NORTHEASTPANNING
	case 26: // CT_SOUTHEASTPANNING
		return cr_size_nwse;
	case 20: // CT_MIDDLEPANNING
	case 29: // CT_MOVE
		return cr_size_all;
	case 34: // CT_PROGRESS
		return cr_appstart;
	case 37: // CT_NONE
		return cr_none;
	case 41: // CT_GRAB
	case 42: // CT_GRABBING
		return cr_drag;
	case 5: // CT_HELP
	case 31: // CT_CELL
	case 32: // CT_CONTEXTMENU
	case 33: // CT_ALIAS
	case 35: // CT_NODROP
	case 36: // CT_COPY
	case 38: // CT_NOTALLOWED
	case 39: // CT_ZOOMIN
	case 40: // CT_ZOOMOUT
	case 43: // CT_CUSTOM
	default:
		return cr_default;
}
