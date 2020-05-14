package asyncfifo

object AsyncFifoGen extends App{
  chisel3.Driver.execute(args,()=>new AsyncFifo(32,2))
}
