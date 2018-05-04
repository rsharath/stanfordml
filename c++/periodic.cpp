#include <iostream>
#include <map>
#include <queue>
#include <stack>
#include <vector>
#include <unordered_map>
#include <string>

using std::vector;
using std::string;
using std::unordered_map;


class edge {
		// string value
		string value;
		std::vector<edge *> children;

		public:
		// constructor
		edge(string val)
		{	
			value = val;
		}

		string getValue()
		{
			return value;
		}

		// get children
		vector <edge *> getChildren()
		{
			return children;
		}

		// operator ==
		bool operator==(edge b){
			return b.value==value;
		}

		// add child
		void addChild(string str){
			edge *foo = new edge(str);
			children.push_back(foo);
		}
};


class graph {
	private:	
		edge *root;
		edge *parent;
		edge *current;
		std::unordered_map<string, int> *ptable;
		int maxpathlength;
		int bFoundMatch;

	public:
	graph() {
		bFoundMatch = false;
		ptable = NULL;
		root = new edge("");
		parent = NULL;
		current = root;
		maxpathlength = 0;
	};

	~graph() {/*iterate and delete all nodes*/}

	//advance
	void advance()
	{
		return;
	}

	void setDictionary(std::unordered_map<string, int> *dict)
	{
		ptable = dict;
	}

	// add an edge
	void addEdge(string glyph)
	{
		// allocate a new node
		edge *node = new edge(glyph);

		// is this the first node of the graph
		if (parent == NULL)
		{
			root->children.push_back(node);
			parent = root;
			current = node;
			return;
		}

		parent = current;
		current->children.push_back(node);
		current = node;
	}

	string printBFSPath()
	{
		std::cout<<"Max Path Length is: "<<maxpathlength<<std::endl;
		std::queue<edge> Q;
		std::vector<edge> children;

		string path = "";

		Q.push(root);

		while (!Q.empty())
		{
			edge t = Q.front();
			path += t.getValue();

			Q.pop()

			if (t == NULL)
				return path;

			children = t.getChildren();
			for (int i = 0; i < children.size(); i++)
			{
				Q.push(children[i]);
			}
		}

		return path;
	}

	void constructGraph(string& word, int &index)
	{
		if ((word.length() <= 0) || (index == -1))
			return;
		else 
			std::cout<<"Word: "<<word<<" of length: "<<index<<std::endl;

		while (index < word.length())
		{
			string test1, test2;

			test1.push_back(word[index]);

			if ( index+1 != word.length())
			{
				test2.push_back(word[index]);
				test2.push_back(word[index+1]);
			}

			if (index >= word.length())
				break;

			std::cout<<test1<<" and "<<test2<<std::endl;
			bool bFoundMatch = false;

			// if if there is either a single || double character match with an element name
			if (ptable->find(test1) != ptable->end())
			{	
				// found
				std::cout<<"Found match: "<<ptable->find(test1)->first<<std::endl;
				addEdge(ptable->find(test1)->first);
				index++;
				maxpathlength++;
				bFoundMatch = true;
				constructGraph(word, index);
			}
			if (ptable->find(test2) != ptable->end())
			{
				// found
				std::cout<<"Found match: "<<ptable->find(test2)->first<<std::endl;
				addEdge(ptable->find(test2)->first);
				index += 2;
				maxpathlength++;
				bFoundMatch = true;
				constructGraph(word, index);
			}
			
			if ((ptable->find(test1) == ptable->end()) || (ptable->find(test2) != ptable->end()))
			{
				std::cout<<"No Match!"<<std::endl;
				bFoundMatch = false;
				index = -1;
				return;
			}
		}
	}

// end class
};


std::unordered_map<string, int> *getPeriodicTable();

int main()
{
	// initialize the periodic table first
	std::unordered_map<string, int> *ptable = getPeriodicTable();

	// initialize a graph
	graph *wordtree = new graph();

	// provide the pointer to the dictionary to the graph
	wordtree->setDictionary(ptable);

	// test
	// std::cout<<dict->find("He")->first<<std::endl;

	string word = "amputations";
	transform(word.begin(), word.end(), word.begin(), ::tolower);

	std::cout<<"Input word to check: "<< word << std::endl;
	//std::cin>>word;

	// construct graph
	int index = 0;
	wordtree->constructGraph(word, index);
	std::cout<<wordtree->printBFSPath();
	//auto checknext = dict->find(word[i]+word[i+1]);
}	


std::unordered_map<string, int> *getPeriodicTable()
{
	// declare a hash map to store the periodic table
	std::unordered_map<string, int> *dict = new std::unordered_map<std::string, int>;

	// populate with periodic table elements
	dict->insert(std::make_pair("h",1));
	dict->insert(std::make_pair("he",2));
	dict->insert(std::make_pair("li",3));
	dict->insert(std::make_pair("be",4));
	dict->insert(std::make_pair("b",5));
	dict->insert(std::make_pair("c",6));
	dict->insert(std::make_pair("n",7));
	dict->insert(std::make_pair("o",8));
	dict->insert(std::make_pair("f",9));
	dict->insert(std::make_pair("ne",10));
	dict->insert(std::make_pair("na",11));
	dict->insert(std::make_pair("mg",12));
	dict->insert(std::make_pair("al",13));
	dict->insert(std::make_pair("si",14));
	dict->insert(std::make_pair("p",15));
	dict->insert(std::make_pair("s",16));
	dict->insert(std::make_pair("cl",17));
	dict->insert(std::make_pair("ar",18));
	dict->insert(std::make_pair("k",19));
	dict->insert(std::make_pair("ca",20));
	dict->insert(std::make_pair("sc",21));
	dict->insert(std::make_pair("ti",22));
	dict->insert(std::make_pair("v",23));
	dict->insert(std::make_pair("cr",24));
	dict->insert(std::make_pair("mn",25));
	dict->insert(std::make_pair("fe",26));
	dict->insert(std::make_pair("co",27));
	dict->insert(std::make_pair("ni",28));
	dict->insert(std::make_pair("cu",29));
	dict->insert(std::make_pair("zn",30));
	dict->insert(std::make_pair("ga",31));
	dict->insert(std::make_pair("ge",32));
	dict->insert(std::make_pair("as",33));
	dict->insert(std::make_pair("se",34));
	dict->insert(std::make_pair("br",35));
	dict->insert(std::make_pair("kr",36));
	dict->insert(std::make_pair("rb",37));
	dict->insert(std::make_pair("sr",38));
	dict->insert(std::make_pair("y",39));
	dict->insert(std::make_pair("zr",40));
	dict->insert(std::make_pair("nb",41));
	dict->insert(std::make_pair("mo",42));
	dict->insert(std::make_pair("tc",43));
	dict->insert(std::make_pair("ru",44));
	dict->insert(std::make_pair("rh",45));
	dict->insert(std::make_pair("pd",46));
	dict->insert(std::make_pair("ag",47));
	dict->insert(std::make_pair("cd",48));
	dict->insert(std::make_pair("in",49));
	dict->insert(std::make_pair("sn",50));
	dict->insert(std::make_pair("sb",51));
	dict->insert(std::make_pair("te",52));
	dict->insert(std::make_pair("i",53));
	dict->insert(std::make_pair("xe",53));
	dict->insert(std::make_pair("cs",55));
	dict->insert(std::make_pair("ba",56));
	dict->insert(std::make_pair("la",57));
	dict->insert(std::make_pair("gf",72));
	dict->insert(std::make_pair("ta",73));
	dict->insert(std::make_pair("w",74));
	dict->insert(std::make_pair("re",75));
	dict->insert(std::make_pair("os",76));
	dict->insert(std::make_pair("ir",77));
	dict->insert(std::make_pair("pt",78));
	dict->insert(std::make_pair("au",79));
	dict->insert(std::make_pair("hg",80));
	dict->insert(std::make_pair("tl",81));
	dict->insert(std::make_pair("pb",82));
	dict->insert(std::make_pair("bi",83));
	dict->insert(std::make_pair("po",84));
	dict->insert(std::make_pair("at",85));
	dict->insert(std::make_pair("rn",86));
	dict->insert(std::make_pair("fr",87));
	dict->insert(std::make_pair("ra",88));
	dict->insert(std::make_pair("ac",89));
	dict->insert(std::make_pair("rf",104));
	dict->insert(std::make_pair("db",105));
	dict->insert(std::make_pair("sg",106));
	dict->insert(std::make_pair("bh",107));
	dict->insert(std::make_pair("hs",108));
	dict->insert(std::make_pair("mt",109));
	dict->insert(std::make_pair("ds",110));
	dict->insert(std::make_pair("rg",111));
	dict->insert(std::make_pair("cn",112));
	dict->insert(std::make_pair("nh",113));
	dict->insert(std::make_pair("fl",114));
	dict->insert(std::make_pair("mc",115));
	dict->insert(std::make_pair("lv",116));
	dict->insert(std::make_pair("ts",117));
	dict->insert(std::make_pair("og",118));
	dict->insert(std::make_pair("ce",58));
	dict->insert(std::make_pair("pr",59));
	dict->insert(std::make_pair("nd",60));
	dict->insert(std::make_pair("pm",61));
	dict->insert(std::make_pair("sm",62));
	dict->insert(std::make_pair("eu",63));
	dict->insert(std::make_pair("gd",64));
	dict->insert(std::make_pair("tb",65));
	dict->insert(std::make_pair("dy",66));
	dict->insert(std::make_pair("ho",67));
	dict->insert(std::make_pair("er",68));
	dict->insert(std::make_pair("tm",69));
	dict->insert(std::make_pair("yb",70));
	dict->insert(std::make_pair("lu",71));
	dict->insert(std::make_pair("th",90));
	dict->insert(std::make_pair("pa",91));
	dict->insert(std::make_pair("u",92));
	dict->insert(std::make_pair("np",93));
	dict->insert(std::make_pair("pu",94));
	dict->insert(std::make_pair("am",95));
	dict->insert(std::make_pair("cm",96));
	dict->insert(std::make_pair("bk",97));
	dict->insert(std::make_pair("cf",98));
	dict->insert(std::make_pair("es",99));
	dict->insert(std::make_pair("fm",100));
	dict->insert(std::make_pair("md",101));
	dict->insert(std::make_pair("no",102));
	dict->insert(std::make_pair("lr",103));

	return dict;
}

