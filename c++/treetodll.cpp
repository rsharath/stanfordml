#include <iostream>

void convert(Node *treeroot, Node ** llroot)
{
	if (root == NULL)
		return;

	// right sub-tree
	convert(treeroot->right, *llroot)


	// root
	treeroot->right = *llroot;

	if (*llroot != NULL)
	{
		(*llroot)->left = treeroot;
	}

	*llroot = treeroot;

	// left subtree
	convert(treeroot->left, *llroot);
}


int main()
{


}