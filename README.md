异步FIFO 
=======================
用chisel实现一个异步FIFO设计，读写指针使用格雷码同步方法。
* FIFO深度，数据位宽可配。深度只能为2^n，且n>=2；
* 复位信号，使能信号皆高有效(high_active)；
* 读写数据与读写使能信号同时有效；
* 不实现overflow和overrun逻辑；
* 不实现almost full和almost empty逻辑；

参考文档：
1. [Simulation and Synthesis Techniques for Asynchronous FIFO Design](http://www.sunburst-design.com/papers/CummingsSNUG2002SJ_FIFO1.pdf)
2. [硬件架构的艺术[M].Mohit Arora](https://book.douban.com/subject/26957371/)
### 1 结构框架
![async_fifo_block_diagram](https://github.com/zhongethan/AsyncFifo/blob/master/src/main/resources/afifo.png)

**端口信号**
|输入|输出|
|----|----|
|wr_clk: 写时钟|rdata: 读数据|
|rd_clk: 读时钟|full: FIFO满标志|
|wr_nrst: 写时钟域复位信号|empty: FIFO空标志|
|rd_nrst: 读时钟域复位信号||
|wr_en: 写使能||
|rd_en: 读使能||
|wdata: 写数据||

#### 1.1 写时序
写数据和写使能信号同时有效。在下一个时钟，数据被锁存到FIFO存储单元中。

![async_fifo_write_timing](https://github.com/zhongethan/AsyncFifo/blob/master/src/main/resources/FIFO_WRITE.png)
#### 1.2 写时序
读数据和读使能同时有效。

![async_fifo_read_timing](https://github.com/zhongethan/AsyncFifo/blob/master/src/main/resources/FIFO_READ.png)
### 2 工作原理
#### 2.1 格雷码同步
多bit数据跨时钟同步时容易出错。
例如源数据从0111-1000跳变，由于每根线的延时不一样，在另一个时钟域采样到的数据有可能是0111-1111-1000的跳变。
使用格雷码计数器可有效的避免这种问题。
 
以3-bit计数器为例：
二进制码的变化规律是 000-001-010-011-100-101-110-111-000
格雷码的变化规律是  000-001-011-010-110-111-101-100-000
很容易发现，格雷码计数器每次只有一个bit变化。
将格雷码计数器同步到另一个时钟域，由于每次只有一个bit发生变化，即使线延时不一样也不会出错。
#### 2.2 FIFO满标志
FIFO复位时，读指针，写指针都指向0地址；写入一个数据至0地址后，写指针指向1地址。再次写入一个数据至1地址后，写指针指向2地址。
以此类推，当FIFO被写满后，写指针再次指向0地址，此时读指针仍然指向0地址。
我们可以暂时认为当写指针等于读指针时，FIFO为满。

仔细思考一下发现，复位之后，读写指针都指向0地址，读写指针也相同，此时FIFO却为空。
为了区分这两种情况，需要额外添加一个高bit位（MSB）。
当读写指针指向同一个地址时，若这个高bit值一样，表明FIFO为空，若不一样，表明FIFO为满。
再结合格雷码的变化规律，FIFO满条件可以确定为：
MSB不同，2ndMSB不同，剩余bit位相同。
#### 2.3 FIFO空标志
由2.2小结推出，FIFO空条件为：读写指针完全相同。
### 3 测试
测试文档见testbench。只包含一个基本读写case。
