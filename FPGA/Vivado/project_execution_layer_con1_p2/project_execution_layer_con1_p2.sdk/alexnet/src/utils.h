#include <stdio.h>
#include<stdbool.h>

size_t getline(char **lineptr, size_t *n, FILE *stream);
void extract_weights(const char *pFileName,float *layer_weights,bool bias);
