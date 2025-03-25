#include <stdio.h>

extern int ax16bit();
extern int eax32bit(int a, int b);
extern int rax64bit(int a, int b);

int main(int argc, char **argv)
{
  printf("%d\n", ax16bit());
  printf("%d\n", eax32bit(4, 6));
  printf("%d\n", rax64bit(6, 6));
  return 0;
}
