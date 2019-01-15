//should compile with "gcc -msse4"
//intel intrinsic instruction:
//  https://software.intel.com/sites/landingpage/IntrinsicsGuide/#expand=3895,4986,3895,3297,127&techs=SSE
#include<stdio.h>
#include<string.h>
#include <mmintrin.h>
#include <xmmintrin.h>
#define max 200
 int main(){
    int i=0, j=0, k=0, p=0;
    float arr[max][max] __attribute__ ((aligned(16))); //store the input data (must be aligned), 16=4 * 4float
    float ans = 0;
    __m128 a, b, c, tmp[max], result[max];	//__mm128 a, contain 4 bytes, which means it contains four "float", and it's a 4 space array.
    for(i=0; i<max; i++){	//init
    	result[i] = _mm_setzero_ps();
	}
    freopen("data.txt", "r", stdin);
    freopen("output_SIMD_SSE.txt", "w", stdout);
    for(i=0; i<max; i++){
        for(j=0; j<max; j++){
            scanf("%f", &arr[i][j]);
        }
    }
    for(k=0; k<max; k++){   //mul's position
        for(i=0; i<max; i++){	//init
			tmp[i] = _mm_setzero_ps();
		}
		for(i=0; i<max; i++){   //row
            for(j=0; j<max/4; j++){   //column
                a = _mm_load_ps(arr[k] + 4*j);
                b = _mm_load_ps(arr[i] + 4*j);
                c = _mm_mul_ps(a, b);
                tmp[k] = _mm_add_ps(tmp[k], c);	//tmp[k] += arr[k][j] * arr[i][j];
            }
        }
        for(i=0; i<max; i++){
            result[p] = _mm_add_ps(tmp[i], result[p]);	//result[p] += tmp[i];
        }
		p++;
    }
    for(i=0; i<max; i++){	//print the answer
        ans = 0;
		for(j=0; j<4; j++){
			ans += result[i][j];
		}
		printf("%.2f\n", ans);
	}
    return 0;
 }

