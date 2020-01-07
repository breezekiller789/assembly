#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#define MaxLine 1024

int main(int argc, char *argv[]){

    int i, j, m, n, row=4, col=5, cnt=1;
    int **input;
    int **kernel;
    input = (int **)malloc(sizeof(int *) * row);
    kernel = (int **)malloc(sizeof(int *) * 3);
    for(i=0; i<row; i++){
        *(input+i) = (int *)malloc(sizeof(int) * col);
        for(j=0; j<col; j++){
            (*(input+i))[j] = cnt++;
        }
    }
    for(i=0; i<3; i++){
        *(kernel+i) = (int *)malloc(sizeof(int) * 3);
        for(j=0; j<3; j++){
            (*(kernel+i))[j] = 1;
        }
    }

    int *output = conv(input, kernel, row, col);

    /* for(i=0; i<(row-3+1); i++){ */
    /*     for(j=0; j<(col-3+1); j++){ */
    /*         int sum=0; */
    /*         for(m=i; m<(i+3); m++){ */
    /*             for(n=j; n<(j+3); n++){ */
    /*                 sum += input[m][n] * kernel[m-i][n-j]; */
    /*             } */
    /*         } */
    /*         printf("%d\n", sum); */
    /*     } */
    /* } */

    return 0;
}
