#include "utils.h"


size_t getline(char **lineptr, size_t *n, FILE *stream)
{
    char *bufptr = NULL;
    char *p = bufptr;
    size_t size;
    int c;

    if (lineptr == NULL) {
        return -1;
    }
    if (stream == NULL) {
        return -1;
    }
    if (n == NULL) {
        return -1;
    }
    bufptr = *lineptr;
    size = *n;

    c = fgetc(stream);
    if (c == EOF) {
        return -1;
    }
    if (bufptr == NULL) {
        bufptr = malloc(128);
        if (bufptr == NULL) {
            return -1;
        }
        size = 128;
    }
    p = bufptr;
    while(c != EOF) {
        if ((p - bufptr) > (size - 1)) {
            size = size + 128;
            bufptr = realloc(bufptr, size);
            if (bufptr == NULL) {
                return -1;
            }
        }
        *p++ = c;
        if (c == '\n') {
            break;
        }
        c = fgetc(stream);
    }

    *p++ = '\0';
    *lineptr = bufptr;
    *n = size;

    return p - bufptr - 1;
}



void extract_weights(const char *pFileName,float *layer_weights,bool bias)
{
	FILE * pFile1 = fopen (pFileName,"rb");
	char delim[2];
	if(bias == true)
		delim[0] = ' ';
	else
		delim[0] = '\n';
	delim[1] = 0;
	char *token;
	int count = 0;
	char *line = NULL;
	size_t len = 0;
	if (!(pFile1 != NULL))
            printf("File Not Found\n");
	if (pFile1 != NULL && (bias == false))
	{
		printf(" File FOUND %s\n",pFileName);
		{

			//fread(weights,sizeof(weights),1,pFile1);
			//token = strtok(weights,delim);
			//while(token != NULL)
			while (getline(&line, &len, pFile1) != -1)
			{
				token = strtok(line,delim);
				float temp_num = atof(token);
			        layer_weights[count] = temp_num;
				//printf("%.8f\t",temp_num);
				count++;
			//	token = strtok(NULL,delim);
			}
		}
		printf("Final Count : %d\n",count);
		fclose(pFile1);
	}
	if (pFile1 != NULL && (bias == true))
	{
		printf(" File FOUND %s\n",pFileName);
		{

			char weights[94590] = "";
			fread(weights,sizeof(weights),1,pFile1);
			token = strtok(weights,delim);
			while(token != NULL)
			{
				float temp_num = atof(token);
			        layer_weights[count] = temp_num;
				//printf("%.8f\t",temp_num);
				count++;
				token = strtok(NULL,delim);
			}
		}
		printf("Final Count : %d\n",count);
		fclose(pFile1);
	}
}

