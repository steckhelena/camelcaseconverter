
#include "ccc_lib.h"

void camelcase_to_underline(char *input, char *output) {
	*(output++) = *(input++) + 32;
	while (*input != '\0') {
		if (*input >= 'A' && *input <= 'Z') {
			*(output++) = '_';
			*(output++) = *(input++) + 32;
		} else {
			*(output++) = *(input++);
		}
	}

	return;
}

void underline_to_camelcase(char *input, char *output) {
	if (*input != '_') {
		*(output++) = *(input++) - 32;
	}
	while (*input != '\0') {
		if (*input == '_') {
			*(output++) = *(++input) - 32;
			input++;
		} else {
			*(output++) = *(input++);
		}
	}

	return;
}




