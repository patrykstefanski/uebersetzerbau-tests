#include <stdio.h>
#include <stdlib.h>

extern long callchecking();

#define RET return

int call(void)
{
#include CALL
}

int main(int argc, char *argv[])
{
  long r;
  r=call();
  if(r==1)
    return 0;
  return 1;
}
