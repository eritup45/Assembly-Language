#include<stdio.h>
#include<string.h>
#define max 200
 int main(){
    int i=0, j=0, k=0;
    int p=0;
    float arr[max][max];  //store the input data
    float tmp[max];
    float result[max];   //store the result
    memset(result, 0, sizeof(result));
    freopen("data.txt", "r", stdin);
    freopen("output.txt", "w", stdout);
    for(i=0; i<max; i++){
        for(j=0; j<max; j++){
            scanf("%f", &arr[i][j]);
        }
    }
    for(k=0; k<max; k++){   //mul's position
        memset(tmp, 0, sizeof(tmp));
        for(i=0; i<max; i++){   //row
            for(j=0; j<max; j++){   //column
                tmp[k] += arr[k][j] * arr[i][j];
            }
        }
        for(i=0; i<max; i++){
            result[p] += tmp[i];
        }
        p++;
    }
    for(i=0; i<p; i++)
        printf("%.2f\n", result[i]);
    return 0;
 }
