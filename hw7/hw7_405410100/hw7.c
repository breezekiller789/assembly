#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#define MaxLine 1024
#define ROW 400
#define COL 400

//  Mention!!
//  This traditional c file is just a simpler version of SIMD one, so i wrote
//  down the comment in the SIMD one, because this c file is just a few line
//  changed, so i don't write comment to this file, to see comments, please
//  checkout hw7simd.c

void Print_Matrix(float **Matrix){
    for(int i=0; i<ROW; i++){
        for(int j=0; j<COL; j++){
            printf("%f ", (*(Matrix+i))[j]);
            if(j==COL-1)
                printf("\n");
        }
    }
}

void ParseInput(FILE *fp, float ***Matrix){
    *Matrix = (float **)malloc(sizeof(float *) * ROW);
    for(int i=0; i<ROW; i++){
        *(*Matrix+i) = (float *)malloc(sizeof(float) * COL);
        for(int j=0; j<COL; j++){
            fscanf(fp, "%f", &(*(*Matrix+i))[j]);
        }
    }
    /* Print_Matrix(*Matrix); */
}

int main(int argc, char *argv[]){

    FILE *fp = fopen("data.txt", "r");
    FILE *output = fopen("output_c.txt", "w");
    float **Matrix, C[COL]={0};
    ParseInput(fp, &Matrix);

    int Round_Cnt=0;
    float sum=0;
    while(Round_Cnt < ROW){
        sum = 0;
        for(int i=0; i<ROW; i++){
            for(int j=0; j<COL; j++){
                C[j] = Matrix[Round_Cnt][j] + Matrix[i][j];
            }
            for(int j=0; j<COL; j++){
                sum += C[j];
            }
        }
        fprintf(output, "%f\n", sum);
        Round_Cnt++;
    }
    fclose(fp);
    fclose(output);

    return 0;
}
