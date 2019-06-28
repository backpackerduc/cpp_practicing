#include <iostream>
#include <type_traits>

int traverseGrid(const int row, const int col) {
  int num = 0;

  if (row > 0 && col > 0) {
    num += traverseGrid(row - 1, col);
    num += traverseGrid(row, col - 1);
  } else {
    num = 1;
  }

  return num;
}

int calcNumOfPaths(const int height, const int width) {
  const int steps_to_go_down = height - 1;
  const int steps_to_go_right = width - 1;
  return traverseGrid(steps_to_go_down, steps_to_go_right);
}

template <int kRowT, int kColT> struct SolutionGridTraverse {
  static constexpr int kNumPaths =
      SolutionGridTraverse<kRowT - 1, kColT>::kNumPaths +
      SolutionGridTraverse<kRowT, kColT - 1>::kNumPaths;
};

template <int kRowT> struct SolutionGridTraverse<kRowT, 0> {
  static constexpr int kNumPaths = 1;
};

template <int kColT> struct SolutionGridTraverse<0, kColT> {
  static constexpr int kNumPaths = 1;
};

template <int kHeightT, int kWidthT> struct NumOfPathsAtCompileTime {
  static constexpr int kSolution =
      SolutionGridTraverse<kHeightT - 1, kWidthT - 1>::kNumPaths;
};

int main() {
  constexpr int number_of_paths_at_compile_time =
      NumOfPathsAtCompileTime<5, 4>::kSolution;

  std::cout << "Solution Compile Time: " << number_of_paths_at_compile_time
            << std::endl;
  std::cout << "Solution Runtime: " << calcNumOfPaths(5, 4) << std::endl;
  return 0;
}
