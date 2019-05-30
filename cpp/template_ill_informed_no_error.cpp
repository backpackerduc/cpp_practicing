#include <iostream>

struct A {};
struct B {};

template<typename T = int>
class Test
{
public:
  Test() = default;
  Test(const A& a) : b(a) {}

  void doStuff(const A& a) {
    b = a;
  }

private:
  B b;
};

int main()
{
  Test<> test;

  std::cout << "test";
  return 0;
}