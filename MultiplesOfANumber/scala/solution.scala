import scala.annotation.tailrec

object Main {
  def main(args: Array[String]) {
    val lines = io.Source.fromFile(args(0)).getLines.toList
    val inputs = lines
      .map(n => n.split(",")
        .map(_.trim))
      .map(n => n.map(_.toInt))

    inputs.foreach(n => println(multiple(n(0), n(1))))
  }

  def multiple(x:Int, n:Int):Int = {

    @tailrec
    def mult(curMultiple:Int):Int = {
      if(curMultiple >= x) curMultiple
      else mult(curMultiple + n)
    }
    mult(n)
  }
}
