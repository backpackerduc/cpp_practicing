#include <iostream>

struct A {};
struct B {};

template<typename T = int>
class Test
{
public:
  Test() = default;
  Test(A a) : b(a) {}

  void doStuff(A a) {}

private:
  B b;
};

int main()
{
  Test<> test;

  std::cout << "test";
  return 0;
}