#include<iostream>

// Given a positive integer N, construct the smallest number K,
// product of whose digits is equal to N.
// e.g., Given N = 100, K = 455
//

class node{
public:
	node *next;
	int value;
};

class Stack
{
	private:
		node *head;
		bool empty;

	public:
		Stack()
		{
			head = NULL;
			empty = true;
		}

		bool isEmpty()
		{
			return empty;
		}

		int pop()
		{
			if (head == NULL)
			{
				// empty stack
				empty = true;
				return -1;
			}

			// return topmost value from head 
			node *p = head;
			int value = p->value;
			delete p;

			// new head now points to the next top element
			head = head->next;
			if (head == NULL)
			{
				empty = true;
			}

			return value;
		}


		void push(int value)
		{
			// nothing to do
			if (value == -1)
			{
				return;
			}

			// p becomes the top pointer so it now points to head
			node *p = new node();
			p->next = head;
			p->value = value;
			empty = false;

			// new head is p
			head = p;
			return;
		}
};


int main()
{
	int N = 0;

	std::cout<<"Input a number: ";
	std::cin>>N;

	Stack *stack = new Stack();
	for (int i = 9; i>=2; i--)
	{
		// if N is divisible by i then push it into the stack
		while (N % i == 0)
		{
			stack->push(i);
			N /= i;
		}
	}

	int lowest = 0;
	while (!stack->isEmpty())
	{
		lowest = 10*lowest +  stack->pop();
	};

	std::cout<<"Lowest product of digits = "<<lowest<<std::endl;
}















