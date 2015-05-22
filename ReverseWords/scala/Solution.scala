import scala.io.Source

object Main {
  def main(args: Array[String]) = {
    io.Source.fromFile(args(0)).getLines.toList
      .map(n => n.split(" ").reverse.mkString(" "))
      .filter(n => n != "")
      .foreach(println)
  }
}
