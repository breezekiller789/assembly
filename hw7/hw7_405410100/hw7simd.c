#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include "xmmintrin.h"
#define MaxLine 1024
#define ROW 400
#define COL 400

//  Print out Matrix to see if it is correct
void Print_Matrix(float **Matrix){
    for(int i=0; i<ROW; i++){
        for(int j=0; j<COL; j++){
            printf("%f ", (*(Matrix+i))[j]);
            if(j==COL-1)
                printf("\n");
        }
    }
}

//  parse input data into Matrix, and malloc() at the same time, it is a little
//  bit complicated but it is reasonable to do so :))
void ParseInput(FILE *fp, float ***Matrix){
    //  Malloc for double pointer
    *Matrix = (float **)malloc(sizeof(float *) * ROW);
    for(int i=0; i<ROW; i++){
        //  Each time enter a row of input, do malloc once
        *(*Matrix+i) = (float *)malloc(sizeof(float) * COL);
        for(int j=0; j<COL; j++){
            //  get each element one by one, and put it into Matrix, see how
            //  i put that in Matrix? That's nuts...
            fscanf(fp, "%f", &(*(*Matrix+i))[j]);
        }
    }
    //  To check if input data is correct, if want so, uncomment it
    /* Print_Matrix(*Matrix); */
}

int main(int argc, char *argv[]){

    FILE *fp = fopen("data.txt", "r");
    FILE *output = fopen("output_simd.txt", "w");
    float **Matrix __attribute__ ((aligned(16)));
    float A[COL] __attribute__ ((aligned(16)));
    float B[COL] __attribute__ ((aligned(16)));
    float C[COL] __attribute__ ((aligned(16)));

    //  Go parse input into Matrix
    ParseInput(fp, &Matrix);

    __m128 *c, **m;
    c = (__m128 *) C;
    m = (__m128 **) Matrix;

    int Round_Cnt=0;    //  Count For Rounds
    float sum=0;
    while(Round_Cnt < ROW){
        sum = 0;
        for(int i=0; i<ROW; i++){
            //  add four float numbers at a time and put each into c
            for(int j=0; j<(COL/4); j++){
                c[j] = _mm_add_ps(m[Round_Cnt][j], m[i][j]);
            }

            //  after it's done, add up each number in C, and that's our result
            //  for each row
            for(int j=0; j<COL; j++){
                sum += C[j];
            }
        }
        //  write it into output.txt
        fprintf(output, "%f\n", sum);
        
        //  Add Round_Cnt for next round
        Round_Cnt++;
    }
    //  close every file discripter that i used
    fclose(fp);
    fclose(output);
    return 0;
}
