#include <iostream>
#include <vector>
#include<cmath>

int main()
{
	int max = 0;

	std::cout<<"Enter the upper bound: ";
	std::cin>>max;
	std::cout<<std::endl;
	bool arr[max];

	for (int i = 0; i<= max; i++)
	{
		// initialize
		arr[i] = true;
	}


	// sieve now
	for (int i = 2; i < std::sqrt(max); i++)
	{
		for (int k = i; k < max;k+=i)
		{
			if ((k != 2) && (k!=3)) arr[k] = false;
		}
	}


	// print answer
	for (int i = 0; i<	 max; i++)
	{
		if (arr[i] == true)
			std::cout<<i<<std::endl;
	}



}
