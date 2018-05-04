#include <iostream>

class node{
	node *next;
	int data;
};

class matrix {
private:
	node *head;
	int rows;
	int cols;
	
public:
	// constr needs to init with dims of the matrix 2 = 2x2, 3 = 3x3 and so on
	matrix(int r, int c)
	{
		head = NULL;
		data = new int[r][c];
	}

	// matrix transpose
	void transpose()
	{

	}

// end class matrix
};


int main()
{
	int rows = 2;
	int cols = 3;
	matrix *m = new matrix(rows, cols);

	// init matrix by iterating on rows
	for (int r = 0; r < rows; r++)
	{
		// iterate cols
		for (int c = 0; c < cols; c++)
		{
			m->data[r][c] = std::rand();
			std::cout<<m->data[r][c]<<" ";
		}
	}
}