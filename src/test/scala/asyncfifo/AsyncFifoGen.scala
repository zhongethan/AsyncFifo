package asyncfifo

object AsyncFifoGen extends App{
  //chisel3.Driver.execute(args,()=>new AsyncFifo(32,2))
  chisel3.Driver.execute(args,()=>new AsyncFifoB(8,3))
}
