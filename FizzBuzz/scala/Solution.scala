import scala.io.Source

object Main {
  def main(args: Array[String]) = {
    val fileName = args(0)
    val fileLines = io.Source.fromFile(fileName).getLines.toList
    fileLines.map(n => n.split(" ").map(m => m.toInt))
      .foreach(n => println(fizzBuzz(n(0),n(1),n(2))))
  }

  def fizzBuzz(firstDivider:Int, secondDivider:Int, count:Int):String = {
    (1 to count)
      .map(n => n match {
        case n if n % firstDivider == 0 && n % secondDivider == 0 => "FB"
        case n if n % firstDivider == 0 => "F"
        case n if n % secondDivider == 0 => "B"
        case n => n.toString
      })
      .mkString(" ")
  }
}
