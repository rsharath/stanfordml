#include <iostream>
#include <string>

using std::string;

class TrieNode {
public:
	TrieNode *children[26];
	int level;
	bool endOfWord;

	TrieNode()
	{
		level = -1;
		endOfWord = false;
		for (int i = 0; i < 26; i++) children[i] = NULL;
	};
};


class Trie {
private:
	TrieNode *root;

public:
	// constructor
	Trie();

	// destructor
	~Trie();

	// insert string into trie
	void insert(string word);

	// search and return true/false
	bool search (string word);

	// print
	void printTrie(TrieNode *node, string str);
	void print();
};

// constructor
Trie::Trie()
{
	root = new TrieNode();
}

// destructor
Trie::~Trie()
{
	delete root;
	root = NULL;
}

// insert function
void Trie::insert(string word)
{
	TrieNode *crawl = root;

	for (int i = 0; i< word.length(); i++)
	{
		// find the array index first 
		int index = word[i] - 'a';
		if (crawl->children[index] == NULL)
		{
			// substring doesn't exists, create a level
			//std::cout<<word[i];
			crawl->children[index] = new TrieNode();
		}

		// step to next level (both if something was found or if we inserted a level)
		crawl = crawl->children[index];
	}

	// reached leaf node so mark end of word
	crawl->endOfWord = true;
}

// search function
bool Trie::search(string word)
{
	TrieNode *crawl = root;

	for (int i = 0; i<word.length(); i++)
	{
		// find the array index first 
		int index = word[i] - 'a';
		if (!crawl->children[index])
		{
			return false; 
		}

		// step to next level (both if something was found or if we inserted a level)
		crawl = crawl->children[index];
	}

	return crawl->endOfWord;
}


// print function
void Trie::printTrie(TrieNode *node, string str)
{
	for (int i = 0; i<26; i++)
	{
		if (node->children[i] != NULL)
		{ 	
			str = str + char('a' + i);
			if (node->children[i]->endOfWord) std::cout<<str<<" ";
			printTrie(node->children[i], str);
		}
	}
}


void Trie::print()
{
	string str;
	printTrie(root, str);
}


int main()
{
	Trie *t = new Trie();
	t->insert("apple");
	t->insert("orange");
	t->insert("mangojuice");
	t->insert("guava");



	t->print();
	std::cout<<std::endl;
}




