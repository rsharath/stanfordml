#include <iostream>

struct node
{
	// 0 .. 9 only
	int digit;
	node *next;
};

class linkedlist 
{
	
	public:
		linkedlist()
		{
			head = NULL;
		}
	
		node *head;


	void printDigits()
	{
		node *ptr = head;
		while (ptr != NULL )
		{
			std::cout<<ptr->digit;
			ptr = ptr->next;
		}
	}

	void insertDigit(int val)
	{
		node *ptr = head;
		if (ptr == NULL)
		{
			// this happens the first time the LL Q is created
			ptr = new node;
			ptr->next = NULL;
			ptr->digit = val;

			head = ptr;
			return;
		}

		// iterate to the end of the list
		while (ptr->next != NULL)
		{
			ptr = ptr->next;
		}

		// interate to the end
		node *newnode = new node;
		newnode->digit = val;
		newnode->next = NULL;
		ptr->next = newnode;
	}


	int reverseList()
	{
		node *ptr = head;
		node *prev = NULL;
		node *next = NULL;
		int llsize = 0;

		// walk through the list and swap values
		while (ptr != NULL)
		{
			next = ptr->next;
			ptr->next = prev;
			prev = ptr;
			ptr = next;
			++llsize;
		}

		// loop will break with ptr=null, so head is now prev
		head = prev;
		return llsize;
	}

};


linkedlist *addlinkedlists(linkedlist* l1, linkedlist *l2)
{
	// create the result linkedlist
	linkedlist *l3 = new linkedlist();

	// reverse lists
	int ll1size = l1->reverseList();
	int ll2size = l2->reverseList();

	// ptr values
	node *ptr1 = l1->head;
	node *ptr2 = l2->head;

	//walk and mind the carry
	int carry = 0;
	while ((ptr1 != NULL) || (ptr2 != NULL))
	{
		// if we have reached the end of ptr1 just copy ptr2 values
		if (ptr1 == NULL)
		{
			l3->insertDigit(ptr2->digit+carry);
			ptr2 = ptr2->next;
			carry = 0;
			continue;
		}

		// if we have reached the end of ptr2 just copy ptr1 values
		if (ptr2 == NULL)
		{
			l3->insertDigit(ptr1->digit+carry);
			ptr1 = ptr1->next;
			carry = 0;
			continue;
		}

		// both lists have valid nodes, now add
		int sum = ptr1->digit + ptr2->digit + carry;

		if (sum >= 10) 
		{
			sum = sum % 10;
			carry = 1;
		}
		else
			carry = 0;

		l3->insertDigit(sum);
		ptr1 = ptr1->next;
		ptr2 = ptr2->next;
	}

	// If I reach the end of both lists and I have a carry, add it
	if (carry != 0)
	{
		l3->insertDigit(carry);
	}

	// need to reverse again :-)
	l3->reverseList();

	// return the linkedlist
	return l3;
}


int main ()
{
	// create LL 1 & 2
	linkedlist *l1 = new linkedlist();
	linkedlist *l2 = new linkedlist();

	l1->insertDigit(5);
	l1->insertDigit(6);
	l1->insertDigit(7);
	l1->insertDigit(8);
	l1->insertDigit(8);
	std::cout<<"List 1: ";
	l1->printDigits();
	std::cout<<"\n";

	l2->insertDigit(1);
	l2->insertDigit(2);
	l2->insertDigit(4);
	l2->insertDigit(7);
	l2->insertDigit(8);
	std::cout<<"List 2: ";
	l2->printDigits();
	std::cout<<"\n";

	linkedlist *l3 = addlinkedlists(l1,l2);
	std::cout<<"Sum of LinkedLists is: ";
	l3->printDigits();
	std::cout<<"\n";

}






