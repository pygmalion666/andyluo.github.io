/** 
 * Insertion Sort
 * 
 * http://www.icourse163.org/learn/NTHU-451013?tid=522006#/learn/content?type=detail&id=948063
 *
 **/
#include <stdio.h>

int main()
{
    int arr[10] = {2, 95, 52, 7, 1, 82, 19, 5, 77, 12};
    int i, x, j;
    int cnt = 0;

    for(i = 1; i < 10; i ++){
        x = arr[i];
        for(j = i - 1; j >= 0; j --){
            if(arr[j] > x){
                cnt ++;
                arr[j+1] = arr[j];
            }
            else{
                cnt ++;
                arr[j+1] = x;
                break;
            }
        }
        if( j < 0){
            arr[0] = x;
        }
    }

    printf("%d \n", cnt);


    return 0;
}
