/**
 * Heap Sort
 * 
 * http://www.icourse163.org/learn/NTHU-451013?tid=522006#/learn/content?type=detail&id=948065
 * 
 **/

#include<stdio.h>

int main()
{
    int list[8] = {90, 1, 46, 79, 19, 41, 97 , 89};
    int ret[8]  = {};
    int i, temp, currentIndex, parentIndex, value, change;

    for(i = 1; i <= 8; i ++){
        value = list[i-1];
        if(1 == i){
            ret[0] = value;
        }
        else{
            currentIndex = i;
            ret[currentIndex - 1] = value;

            while(( parentIndex = (int)(currentIndex / 2) ) > 0){
                //Change current value to it's parent
                printf("%d %d\n", currentIndex, parentIndex);
                if(ret[currentIndex - 1] < ret[parentIndex - 1]){
                    temp = ret[parentIndex];
                    ret[parentIndex] = ret[currentIndex - 1];
                    ret[currentIndex - 1] = temp;

                    currentIndex = parentIndex;
                }
                break;
            }
        }
    }

    for(i = 1; i <= 8; i ++){
        //printf("%d\n", ret[i-1]);
    }


    return 0;
}
