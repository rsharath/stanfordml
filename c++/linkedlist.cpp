#include <iostream>
struct node
{
	int data;
	node *next;
};

class linkedlist
{
	private:
		node *head, *tail;

	public:
		// constructor
		linkedlist()
		{
			head = NULL;
			tail = NULL;
		}

	// print the linkedlist
	void printdata()
	{
		node *currentnode = head;
		while (currentnode != NULL) {
			std::cout<< currentnode->data<<" ";
			currentnode = currentnode->next;
		}
		std::cout<<"\n";
		return;
	}

	// create a node
	void createNode(int value)
	{
		node *n = new node;
		n->data = value;
		n->next = NULL;

		if (head == NULL)
		{
			head = n;
			tail = n;
		}
		else
		{
			tail->next = n;
			tail = n;
		}
	}

   void reverseList()
   {
      if ((head == NULL) || (head->next == NULL))
      {
         // nothing to do
         return;
      }

      node *current = head->next;
      node *previous = head;

      while (current != tail)
      {
         node *temp = current->next;
         current->next = previous;
         previous = current;
         current = temp;
      }
      
      return;
   }


	// delete a node given the node value
	bool deleteNode(int value)
	{
		node *currentnode = head;
		node *previousnode = head;
		bool foundValue = false;
		int position = 1;

		// found value at head
		if (head->data == value)
		{
			delete currentnode;
			head = NULL;
			tail = NULL;
			return true;
		}

		// go through the head value
		while (currentnode != tail)
		{
			// found value
			if (currentnode->data == value)
			{
				node *temp = currentnode;
				previousnode->next = temp->next;
				temp->next = NULL;
				delete temp;

				//reset current node;
				currentnode = previousnode->next;

				foundValue = true;
				continue;
			}

			// increment position for next node
			previousnode = currentnode;
			currentnode = currentnode->next;
			++ position;
		}

		return foundValue;
	}

};


// main
int main()
{
	// create a linked list
	linkedlist *llist = new linkedlist;

	// insert values (enqueue)
	llist->createNode(1);
	llist->createNode(3);
	llist->createNode(5);
	llist->createNode(4);
	llist->createNode(3);
	llist->createNode(5);
	llist->createNode(19);

	// print llist
	std::cout<<"Created a linkedlist with seed values...\n";
	llist->printdata();
	std::cout<<"\n";

	// delete node
	std::cout<<"Deleting nodes 3, 19 \n";
	llist->deleteNode(3);
	llist->deleteNode(19);
	llist->printdata();
}
