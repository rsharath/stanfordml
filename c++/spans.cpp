#include <iostream>

int main()
{
   int price[] = {100, 80, 60, 70, 50, 75, 85};

   int length = 7;

   int span[length];
   span[0] = 1;

   for (int i = 1; i < length; i++)
   {
      span[i] = 1;

      for (int j = i-1; ((j >= 0) && (price[j] <= price[i])); j--)
         span[i]++;
   }

   for (int i = 0; i < length; i++)
   {
      std::cout<<"price: "<<price[i]<<" span: "<<span[i]<<std::endl;
   }
}
