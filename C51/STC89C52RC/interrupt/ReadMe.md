**这个程序可以在编译的时候定义DOWN宏来决定是下降沿还是低电平触发，有助于比较两者的不同。**
如果想要下降沿触发，请：
```c
sdcc -DDOWN main.c
```
如果想要低电平触发，请:
```c
sdcc main.c
```