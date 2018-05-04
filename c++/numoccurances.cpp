#include <iostream>

// given a number N, find all occurances of digits [1..9]
// between 0 and N

int main()
{
	int N = 0;
	int arr[10] = {1,0,0,0,0,0,0,0,0,0};
	
	std::cout<<"Enter number N: ";
	std::cin>>N;

	if (N < 0)
		return -1;

	int iter = N;

	while (iter > 0)
	{	
		int index = iter;
		while (index > 0)
		{
			int digit = index%10;
			arr[digit]++;
			index = index/10;
		}
		iter --;
	}

	for (int i =0; i<= 9; i++)
		std::cout<<"Number of "<<i<<"s is: "<<arr[i]<<std::endl;

}
