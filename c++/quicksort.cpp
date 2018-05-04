#include<iostream>

//
// standard quicksort algorithm
//

int partition(int arr[], int start, int end)
{
	// starting index
	int index = start;

	for (int i = start+1; i < end; i++)
	{
		if (arr[i] > arr[start])
		{
			index++;
			std::swap(arr[index], arr[i]);
		}
	}

	std::swap(arr[index], arr[start]);

	return index;
}

void quicksort (int arr[], int start, int end)
{
	if (start < end)
	{
		int q = partition(arr, start, end);
		quicksort(arr, start, q);
		quicksort(arr, q+1, end);
	}
}

void printarray(int arr[], int size)
{
	std::cout<<"\n printing array of size("<<size<<") :  ";
	for (int i = 0; i < size; i++)
	{
		std::cout<<arr[i]<<", ";
	}
    std::cout << std::endl;
	return;
}

int main ()
{
	int arr[10] = {1,2,3,4,5,0,4,3,2,1};
	std::cout<<"Input Array";
	printarray(arr, 10);
	quicksort(arr, 0, 10);
	std::cout<<"Sorted Array";
	printarray(arr,10);
}
