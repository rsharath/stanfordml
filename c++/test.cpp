#include <iostream>
/*
struct precinct {
   char name[12];
   int code;
};
*/
/*
(Simplified BSD License)
-------------------------------------------------------------------------------
Copyright 2011 Nghia Ho. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are
permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice, this list of
      conditions and the following disclaimer.

   2. Redistributions in binary form must reproduce the above copyright notice, this list
      of conditions and the following disclaimer in the documentation and/or other materials
      provided with the distribution.

THIS SOFTWARE IS PROVIDED BY NGHIA HO ``AS IS'' AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL NGHIA HO OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those of the
authors and should not be interpreted as representing official policies, either expressed
or implied, of Nghia Ho.
*/

#include <vector>

using namespace std;

class Node
{
public:
	void AddLink(int id)
	{
		next.push_back(id);
	}

public:
	vector <int> next;
};

void FindAllPathsAt(vector <Node> &all_nodes, int id, vector < vector<int> > &all_paths, vector <int> tmp)
{
    tmp.push_back(id);

    if(all_nodes[id].next.size() == 0) {
        all_paths.push_back(tmp);
        return;
    }

    for(size_t i=0; i < all_nodes[id].next.size(); i++) {
        vector <int> tmp2(tmp);
        FindAllPathsAt(all_nodes, all_nodes[id].next[i], all_paths, tmp2);
    }
}

void PrintPaths(const vector < vector<int> > &all_paths)
{
	for(size_t i=0; i < all_paths.size(); i++) {
        // Don't print node if it points to nothing
        if(all_paths[i].size() == 1) {
            continue;
        }

		cout << all_paths[i][0];

		for(size_t j=1; j < all_paths[i].size(); j++) {
			cout << " -- > " << all_paths[i][j];
		}

		cout << endl;
	}
}

int main()
{
	vector <Node> all_nodes(28);

    all_nodes[0].AddLink(4);
    all_nodes[1].AddLink(5);
    all_nodes[2].AddLink(4);
    all_nodes[2].AddLink(5);
    all_nodes[3].AddLink(4);
    all_nodes[3].AddLink(5);
    all_nodes[4].AddLink(6);
    all_nodes[4].AddLink(7);
    all_nodes[5].AddLink(6);
    all_nodes[6].AddLink(8);
    all_nodes[6].AddLink(9);
    all_nodes[6].AddLink(11);
    all_nodes[6].AddLink(13);
    all_nodes[6].AddLink(14);
    all_nodes[6].AddLink(15);
    all_nodes[6].AddLink(18);
    all_nodes[6].AddLink(21);
    all_nodes[6].AddLink(22);
    all_nodes[6].AddLink(25);
    all_nodes[7].AddLink(10);
    all_nodes[7].AddLink(12);
    all_nodes[7].AddLink(16);
    all_nodes[7].AddLink(17);
    all_nodes[7].AddLink(19);
    all_nodes[7].AddLink(20);
    all_nodes[7].AddLink(23);
    all_nodes[7].AddLink(24);
    all_nodes[7].AddLink(26);
    all_nodes[7].AddLink(27);

    vector <int> tmp; // work space

	for(size_t i=0; i < all_nodes.size(); i++) {
		vector < vector<int> > all_paths;
		FindAllPathsAt(all_nodes, i, all_paths, tmp);

		cout << "All paths at node " << i << endl;
		PrintPaths(all_paths);
	}

	return 0;
}
